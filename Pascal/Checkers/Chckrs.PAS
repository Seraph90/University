program Checkers;
uses
  crt,graph,
  ChckrsG;

label
  step;

begin
  BoardStart;
  BoardRedraw;
  i:=3;
  j:=5;
  u:=12;
  k:=12;
  repeat
    {>
    if keypressed
    then
    <}
    key:=readkey;
    setcolor(BrdClr);
    rectangle(i*55+5,j*55+5,i*55+60,j*55+60);   {стирание курсора}
    case key
    of
      #27:Break;
      #72:
        if j>0
        then
          j:=j-1;
      #80:
        if j<7
        then
          j:=j+1;
      #75:
        if i>0
        then
          i:=i-1;
      #77:
        if i<7
        then
          i:=i+1;
      #13:
        if (not st) or (BrdM[i,j]>2)
        then
          begin
            sti:=i;
            stj:=j;
            st:=true;
          end
        else
          begin
            CanTake(3);       {можем ли мы срубить}
            sd:=0;
            if (((i+j) mod 2)=0) {проверяет что можно сходить типа на клетку}
            and (BrdM[i,j]=0)    {проверяет пустая или нет}
            and (((stj+sti*10) in s) or (s=[]))    {пров - ей можно рубить или ничем незя рубить}
            then
              begin
                if (BrdM[sti,stj]=3)  {если выбрана пешка}
                then
                  begin
                    if (abs(sti-i)<>1) or (stj-j<>1) or ((stj+sti*10) in s)
                    then
                      if ((abs(sti-i)=2) or (abs(stj-j)=2))
                      and (BrdM[(sti+i) div 2,(stj+j) div 2] in [1,2])
                      then
                        begin
                          BrdM[(sti+i) div 2,(stj+j) div 2]:=0;
                          bar(((sti+i) div 2)*55+7,((stj+j) div 2)*55+7,((sti+i)div 2)*55+58,((stj+j)div 2)*55+58);
                          sd:=1;
                          k:=k-1;
                        end
                      else
                        continue;
                  end
                else
                  if BrdM[sti,stj]=4
                  then
                    if abs(sti-i)<>abs(stj-j)
                    then
                      continue
                    else
                      begin
                        for r:=1 to abs(sti-i)-1
                        do
                          case BrdM[sti+r*(i-sti) div abs(i-sti),stj+r*(j-stj) div abs(j-stj)]
                          of
                            1:sd:=sd+1;
                            2:sd:=sd+10;
                            3,4:sd:=sd+100;
                          end;
                        if (((stj+sti*10) in s) and (sd in [1,10])) or ((s=[]) and (sd=0))
                        then
                          begin
                            for r:=1 to abs(sti-i)-1
                            do
                              if BrdM[sti+r*(i-sti) div abs(i-sti),stj+r*(j-stj) div abs(j-stj)]>0
                              then
                                begin
                                  BrdM[sti+r*(i-sti) div abs(i-sti),stj+r*(j-stj) div abs(j-stj)]:=0;
                                  bar((sti+r*(i-sti) div abs(i-sti))*55+7,(stj+r*(j-stj) div abs(j-stj))*55+7,
                                    (sti+r*(i-sti) div abs(i-sti))*55+58,(stj+r*(j-stj) div abs(j-stj))*55+58);
                                  k:=k-1;
                                  break;
                                end;
                          end
                        else
                          continue;
                      end;
                BrdM[i,j]:=BrdM[sti,stj];
                BrdM[sti,stj]:=0;
                if j=0
                then
                  BrdM[i,j]:=4;
                bar(sti*55+7,stj*55+7,sti*55+58,stj*55+58);
                putimage(i*55+6,j*55+6,Ch[BrdM[i,j]]^,1);
                sti:=i;
                stj:=j;
                if sd<>0
                then
                  CanTake(3);
                if s=[]
                then
                  repeat
                    sd:=0;
                    CanTake(1);
                    for sti:=0 to 7
                    do
                      for stj:=0 to 7
                      do
                        begin
                          if BrdM[sti,stj] in [1,2]
                          then
                            if s=[]
                            then
                              begin
                                for ii:=-1 to 1
                                do
                                  for jj:=-1 to 1
                                  do
                                    if ((sti+ii) in [0..7]) and ((stj+jj) in [0..7])
                                    and (ii*jj<>0) and ((BrdM[sti,stj]=2) or (jj=1))
                                    and (BrdM[sti+ii,stj+jj]=0)
                                    then
                                      goto step;
                              end
                            else
                              if stj+sti*10 in s
                              then
                                begin
                                  r:=5*byte(BrdM[sti,stj]=2);
                                  for ii:=-2-r to 2+r
                                  do
                                    for jj:=-2-r to 2+r
                                    do
                                      if ((sti+ii) in [0..7]) and ((stj+jj) in [0..7])
                                      and (ii*jj<>0) and (abs(ii)>1) and (abs(ii)=abs(jj))
                                      and (BrdM[sti+ii,stj+jj]=0)
                                      then
                                        begin
                                          sd:=0;
                                          for r:=1 to abs(ii)-1
                                          do
                                            case BrdM[sti+r*(ii) div abs(ii),stj+r*(jj) div abs(jj)]
                                            of
                                              3:sd:=sd+1;
                                              4:sd:=sd+10;
                                              1,2:sd:=sd+100;
                                            end;
                                          if (((stj+sti*10) in s) and (sd in [1,10])) or ((s=[]) and (sd=0))
                                          then
                                            begin
                                              for r:=1 to abs(ii)-1
                                              do
                                                if BrdM[sti+r*(ii) div abs(ii),stj+r*(jj) div abs(jj)]>0
                                                then
                                                  begin
                                                    BrdM[sti+r*(ii) div abs(ii),stj+r*(jj) div abs(jj)]:=0;
                                                    bar((sti+r*(ii) div abs(ii))*55+7,(stj+r*(jj) div abs(jj))*55+7,
                                                      (sti+r*(ii) div abs(ii))*55+58,(stj+r*(jj) div abs(jj))*55+58);
                                                    u:=u-1;
                                                    goto step;
                                                  end;
                                            end;
                                        end;
                                end;
                        end;
                    continue;
                    step:
                    BrdM[sti+ii,stj+jj]:=BrdM[sti,stj];
                    BrdM[sti,stj]:=0;
                    if stj+jj=7
                    then
                      BrdM[sti+ii,stj+jj]:=2;
                    bar(sti*55+7,stj*55+7,sti*55+58,stj*55+58);
                    putimage((sti+ii)*55+6,(stj+jj)*55+6,Ch[BrdM[sti+ii,stj+jj]]^,1);
                    if sd<>0
                    then
                      CanTake(1);
                    MDelay(50);
                  until (s=[]) or (sd=0);
              end;
      end;
    end;
    setcolor(10);
    rectangle(i*55+5,j*55+5,i*55+60,j*55+60);
    {>
    MDelay(5);
    <}
    key:=#0;
  until (k=0) or (u=0);
  if k=0
  then
    outtextxy(100,100,'Congratulations. You win!!!')
  else
    outtextxy(100,100,'Achtung, computer win!!!');
  readkey;
  closegraph;
end.