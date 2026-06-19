#define PIEZO_PIN  9 // Pin connected to the piezo buzzer.

int tone_freq = 400;

void setup()
{
  Serial.begin(115200);
}

void loop()
{
  while (true)
  {
    // Beep piezo if plants need wanter (not implemented yet)
    tone(PIEZO_PIN, tone_freq);
    delay(500);
    noTone(PIEZO_PIN);

    // Wait 15 minutes before testing soil moisture and beep the Piezo if required
    delay(900000);
  }
}
