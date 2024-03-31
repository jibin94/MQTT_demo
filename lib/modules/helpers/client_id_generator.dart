import 'dart:math';

String generateRandomClientId() {
  // Define the characters from which the ID will be generated
  const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
  final random = Random();
  final idLength = 10; // Define the length of the client ID

  // Generate a random client ID by selecting characters randomly from the defined set
  String clientId = '';
  for (int i = 0; i < idLength; i++) {
    clientId += chars[random.nextInt(chars.length)];
  }
  return clientId;
}

String generateRandomID() {
  Random random = Random();
  int randomNumber = random.nextInt(10000); // Generate a random number between 0 and 9999
  String fourDigitID = randomNumber.toString().padLeft(4, '0'); // Ensure the ID has 4 digits
  return fourDigitID;
}