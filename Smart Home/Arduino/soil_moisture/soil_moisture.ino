#define PIEZO_PIN  9 // Pin connected to the piezo buzzer.

int tone_freq = 400;
int tone_count = 8;

void setup()
{
  Serial.begin(115200);
}

void loop()
{
  while (true)
  {
    // Beep piezo three times if plants need wanter (not implemented yet)
    for (int i = 0; i < tone_count; i++)
    {
      tone(PIEZO_PIN, tone_freq);
      delay(1000);
      noTone(PIEZO_PIN);
      delay(1000);
    }

    // Wait 15 minutes before testing soil moisture and beep the Piezo if required
    delay(900000);
  }
}
