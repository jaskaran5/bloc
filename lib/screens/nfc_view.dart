import 'dart:convert';
import 'dart:developer';

import 'package:nfc_manager/nfc_manager.dart';

class NFCHelperUtils {
  Future<bool> isAvailableNfc() async {
    bool isAvailable = await NfcManager.instance.isAvailable();

    if (isAvailable) {
      log("NFC AVAILABLE");

      return true;
    } else {
      log("Nfc not supported by device");
      return false;
    }
  }

  void stopNFCListener() {
    NfcManager.instance.stopSession();
  }

  bool isPayloadEmpty(String jsonStr) {
    // Parse the JSON string
    Map<String, dynamic> jsonData = jsonDecode(jsonStr);

    // Check if the 'ndef' section exists
    if (jsonData.containsKey('ndef')) {
      // Get the 'ndef' section
      Map<String, dynamic> ndef = jsonData['ndef'];

      // Check if 'cachedMessage' exists in the 'ndef' section
      if (ndef.containsKey('cachedMessage')) {
        // Get the 'cachedMessage' section
        Map<String, dynamic> cachedMessage = ndef['cachedMessage'];

        // Check if 'records' exists in the 'cachedMessage' section
        if (cachedMessage.containsKey('records')) {
          // Get the 'records' list
          List<dynamic> records = cachedMessage['records'];

          // Iterate over each record
          for (var record in records) {
            // Check if 'payload' exists in the record and if it's empty
            if (record.containsKey('payload') &&
                (record['payload'] as List).isEmpty) {
              return true; // Payload is empty
            }
          }
        }
      }
    }

    // If payload is not found empty
    return false;
  }

  Future<dynamic> writeNfcData(
      {required dynamic content, bool writePermanent = false}) async {
    if (await isAvailableNfc()) {
      log("NFC available");
      dynamic result;
      if (!writePermanent) {
        log("Starting session");
        try {
          await NfcManager.instance.startSession(
            onDiscovered: (NfcTag tag) async {
              log("tag ${tag.handle} ${jsonEncode(tag.data)}");
              log('tag data >>>>>>>${tag.data}');

              if (isPayloadEmpty(jsonEncode(tag.data))) {
                if (tag.data.isNotEmpty) {
                  var ndef = Ndef.from(tag);
                  if (ndef == null || !ndef.isWritable) {
                    NfcManager.instance
                        .stopSession(errorMessage: "Tag is not ndef writable");
                    throw Exception("Tag is not ndef writable");
                  }

                  NdefMessage message = NdefMessage([
                    NdefRecord.createUri(Uri.parse(content)),
                  ]);

                  await ndef.write(message);
                  result = 'Success to "Ndef Write"';
                  NfcManager.instance.stopSession();
                } else {
                  log("This tag already activated with another platform");
                  result = "Tag already activated with another platform";
                }
              } else {
                log("Data already written");
                result = "Data already written";
              }
            },
          );

          if (result == null) {
            throw Exception(
                "No NFC tag discovered or session stopped before writing.");
          }

          return result;
        } catch (e) {
          NfcManager.instance.stopSession(errorMessage: e.toString());
          rethrow;
        }
      }
    }
  }

// Future<dynamic> writeNfcData(
//     {required dynamic content, bool writePermanent = false}) async {
//   if (await isAvailableNfc()) {
//     logConsole("NFC available");
//     dynamic result;
//     if (!writePermanent) {
//       logConsole("Starting session");
//       await NfcManager.instance.startSession(
//           onDiscovered: (NfcTag tag) async {
//             logConsole("tag ${tag.handle} ${jsonEncode(tag.data)}");
//             logConsole(isPayloadEmpty(jsonEncode(tag.data)),tag: "has_data");
//
//             if(isPayloadEmpty(jsonEncode(tag.data))){
//               if(tag.data.isNotEmpty){
//                 var ndef = Ndef.from(tag);
//                 if (ndef == null || !ndef.isWritable) {
//                   NfcManager.instance
//                       .stopSession(errorMessage: "Tag is not ndef writable");
//                   result = "Tag is not ndef writable";
//                   return;
//                 }
//
//                 NdefMessage message = NdefMessage([
//                   // NdefRecord.createText('Hello World!'),
//                   NdefRecord.createUri(Uri.parse(content)),
//                   // NdefRecord.createMime(
//                   //     'text/plain', Uint8List.fromList('Hello'.codeUnits)),
//                   // NdefRecord.createExternal('com.example', 'mytype',
//                   //     Uint8List.fromList('mydata'.codeUnits)),
//                 ]);
//
//                 try {
//
//                   logConsole(ndef.isWritable,tag: "Is_Writable");
//
//                   await ndef.write(message).then((value) {
//                     print("value");
//                   });
//                   result = 'Success to "Ndef Write"';
//                   NfcManager.instance.stopSession();
//                 } catch (e) {
//                   result = e;
//                   NfcManager.instance
//                       .stopSession(errorMessage: result.value.toString());
//                   throw e;
//                 }
//               } else {
//                 toast(msg: "This tag already activated with another platform");
//               }
//             } else {
//               toast(msg: "data already written");
//             }
//
//
//
//
//
//       });
//     }
//   }
// }
}
