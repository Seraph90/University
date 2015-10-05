void setup()
{
  Serial.begin(9600);
  pinMode(9,INPUT);
}

void loop() 
{
  int mStr, mStop, Str, Stop, i, j, k=0;
  boolean oneStep=false, lastStep=false;
  mStr=micros();
  Str=millis();
  j=0;
  if(digitalRead(9)==0) 
  {
    for(;;)
    {
      i=digitalRead(9);
      i==0?digitalWrite(13,HIGH):digitalWrite(13,LOW);
      if(i==1)
        k++;
      else
      {
        if (10<k && k<50)
          Serial.print(0);
        if (90<k && k<130)
          Serial.print(1);
        k=0;
      }
      mStop=micros();
      j+=i;
      if (((mStop-mStr)>=9000) && (j==0) && (oneStep==false))
      {
        oneStep=true;
        j=0;
        mStr=micros();
      }
      Stop=millis();
      if ((Stop-Str)>=70) 
      {
        oneStep=false;
        break;
      }
    }
  }    
}

