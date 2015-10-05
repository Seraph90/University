unit Ser_Main;

interface

uses
  Ser_DBF,Ser_DBM,crt;

  procedure Main;

implementation

procedure Main;
begin
  DrawAll;
  menu:=1;
  Cur(0);
  SScr(1,1,80,25);
  CSel(2,9,0,vm);
  repeat
    cc:=ord(readkey);
    if menu=1
    then
      case cc
      of
         9:if (s<>'') and (filesize(curf)>0)
           then
             begin
               menu:=0;
               ud:=0;
               LScr(1,2,80,24);
               window(1,1,80,25);
               CSel(3,46,nm+2,$2f);
             end;
        75:begin
             if ud<>0
             then
               ud:=1;
             SFrame((lr+3) mod (4),ud);
           end;
        77:begin
             if ud<>0
             then
               ud:=1;
             SFrame((lr+1) mod (4),ud);
           end;
        72:if ud<>0
           then
             SFrame(lr,((ud+(col-2)) mod col )+1);
        80:begin
             if ud=0
             then
               begin
                 ud:=1;
                 SFrame(lr,ud);
               end
             else
               SFrame(lr,(ud mod col)+1);
           end;
        27:begin
             ud:=0;
             LScr(1,1,80,8);
           end;
        59:MHelp;
        61:MOpen;
        68:break;
        13:begin
             case lr
             of
               0:case ud
                 of
                   1:MNew;
                   2:MOpen;
                   3:MSave;
                   4:break;
                 end;
               1:if s<>''
                 then
                   case ud
                   of
                     1:MAdd;
                     2:MEdit;
                     3:MDel;
                   end;
               2:case ud
                 of
                   1:MFind(curr.f1);
                   2:MFind(curr.f2);
                   3:MFind(curr.d);
                 end;
               3:case ud
                 of
                   1:MHelp;
                   2:MAbout;
                 end;
             end;
             ud:=0;
           end;
        end
      else
        case cc
        of
          59:MHelp;
          61:MOpen;
          68:break;
          83:MDel;
          13:MEdit;
           9:begin
               menu:=1-menu;
               CSel(lr*10+2,9,0,vm);
               CSel(3,46,nm+2,vs);
               SScr(3,3,78,23);
             end;
          72:begin
               CSel(3,46,nm+2,glp);
               if nm>0
               then
                 nm:=nm-1
               else
                 if n>1
                 then
                   begin
                     n:=n-1;
                     ShowFile(n);
                   end;
               ShowInf;
               CSel(3,46,nm+2,vs);
             end;
          80:begin
               CSel(3,46,nm+2,glp);
               if (nm<20) and (nm+1<filesize(curf))
               then
                 nm:=nm+1
               else
                 begin
                 if n<filesize(curf)-20
                 then
                   begin
                     n:=n+1;
                     ShowFile(n);
                   end;
                 end;
               ShowInf;
               CSel(3,46,nm+2,vs);
             end;
        end
  until false;
  Cur(1);
end;

begin
end.
