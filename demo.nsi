Var MSG
Var Dialog

Var BGImage
Var MiddleImage
Var ImageHandle
Var Btn_Next
Var Btn_Cancel
Var Btn_Agreement
Var Bool_License
Var Txt_License
Var Btn_Close
Var WarningForm

Var Ck_ShortCut
Var Bool_ShortCut
Var Lbl_ShortCut

Var Ck_AutoRun
Var Bool_AutoRun
Var Lbl_AutoRun

Var Ck_FinishPage
Var Bool_FinishPage
Var Lbl_FinishPage

Var Btn_Install

Var Txt_Browser
Var Btn_Browser

Var Btn_DetailsPrint
Var UDetailsPrint   ;��ϸ��������
Var Txt_DetailsPrint  ;��ϸ���ֿ�ؼ�
Var Bool_DetailsPrint ;��¼�Ƿ���ʾ��ϸ��Ϣ�ı���

Var Lbl_Sumary
Var PB_ProgressBar

Var WebImg ;��ҳ�ؼ�

Var Ck_Weibo
Var Bool_Weibo
Var Lbl_Weibo
Var Btn_Complete

Var PPercent

Var ISMSI
Var ISNETF




;---------------------------ȫ�ֱ���ű�Ԥ����ĳ���-----------------------------------------------------
!define  EM_BrandingText "testtest"
; MUI Ԥ���峣��
!define MUI_ABORTWARNING
;��װͼ���·������
!define MUI_ICON "images\fav.ico"
;ж��ͼ���·������
!define MUI_UNICON "images\fav.ico"
;��ƷЭ�����·������
;!define MUI_PAGE_LICENSE_RTY "license\license.rtf"
!define OUTFILE_NAME "test.exe"

!addplugindir "Plugins"

;---------------------------�������ѹ�����ͣ�Ҳ����ͨ���������ű����ƣ�------------------------------------
SetCompressor lzma
BrandingText "�ò���Ʒ"
SetCompress force
XPStyle on
; ------ MUI �ִ����涨�� (1.67 �汾���ϼ���) ------
!include "MUI2.nsh"
!include "WinCore.nsh"
;�����ļ�����ͷ�ļ�
!include "FileFunc.nsh"
!include "nsWindows.nsh"
!include "LoadRTF.nsh"
!include "WinMessages.nsh"
!include "WordFunc.nsh"

!define MUI_CUSTOMFUNCTION_GUIINIT onGUIInit

;�Զ���ҳ��
Page custom WelcomePage
Page custom InstallationPage
Page custom LoadingPage
Page custom CompletePage

; ���Э��ҳ��
!define MUI_LICENSEPAGE_CHECKBOX

; ��װĿ¼ѡ��ҳ��
!insertmacro MUI_PAGE_DIRECTORY
; ��װ����ҳ��
!insertmacro MUI_PAGE_INSTFILES
; ��װ���ҳ��
!insertmacro MUI_PAGE_FINISH
; ��װж�ع���ҳ��
!insertmacro MUI_UNPAGE_INSTFILES
; ��װ�����������������
!insertmacro MUI_LANGUAGE "SimpChinese"

;------------------------------------------------------MUI �ִ����涨���Լ���������------------------------
;Ӧ�ó�����ʾ����
Name "test"
;Ӧ�ó������·��
OutFile "${OUTFILE_NAME}"
InstallDir "$PROGRAMFILES\test"

RequestExecutionLevel admin

Function .onInit
    InitPluginsDir
    File `/ONAME=$PLUGINSDIR\bg.bmp` `images\bg.bmp`
    File `/ONAME=$PLUGINSDIR\quit.bmp` `images\quit.bmp`
    File `/ONAME=$PLUGINSDIR\select.bmp` `images\select.bmp`
    File `/ONAME=$PLUGINSDIR\welcome.bmp` `images\welcome.bmp`
		File `/ONAME=$PLUGINSDIR\btn_next.bmp` `images\btn_next.bmp`
		File `/oname=$PLUGINSDIR\btn_agreement1.bmp` `images\btn_agreement1.bmp`
    File `/oname=$PLUGINSDIR\btn_agreement2.bmp` `images\btn_agreement2.bmp`
    File `/oname=$PLUGINSDIR\license.rtf` `license\license.rtf`
    File `/oname=$PLUGINSDIR\btn_close.bmp` `images\btn_close.bmp`
    File `/oname=$PLUGINSDIR\btn_cancel.bmp` `images\btn_cancel.bmp`
    File `/oname=$PLUGINSDIR\checkbox1.bmp` `images\checkbox1.bmp`
    File `/oname=$PLUGINSDIR\checkbox2.bmp` `images\checkbox2.bmp`
    File `/oname=$PLUGINSDIR\btn_quit.bmp` `images\btn_quit.bmp`
   	File `/oname=$PLUGINSDIR\btn_install.bmp` `images\btn_install.bmp`
   	File `/oname=$PLUGINSDIR\btn_change.bmp` `images\btn_change.bmp`

   	File `/oname=$PLUGINSDIR\index.htm` `images\index.htm`
    File `/oname=$PLUGINSDIR\loading_pic1.bmp` `images\loading_pic1.bmp`
    File `/oname=$PLUGINSDIR\loading_pic2.bmp` `images\loading_pic2.bmp`
    File `/oname=$PLUGINSDIR\loading_pic3.bmp` `images\loading_pic3.bmp`
    File `/oname=$PLUGINSDIR\loading_pic4.bmp` `images\loading_pic4.bmp`
   	File `/oname=$PLUGINSDIR\installation.bmp` `images\installation.bmp`

   	File `/oname=$PLUGINSDIR\loading1.bmp` `images\loading1.bmp`
    File `/oname=$PLUGINSDIR\loading2.bmp` `images\loading2.bmp`
    File `/oname=$PLUGINSDIR\btn_complete.bmp` `images\btn_complete.bmp`
    File `/oname=$PLUGINSDIR\success.bmp` `images\success.bmp`

		SkinBtn::Init "$PLUGINSDIR\btn_next.bmp"
		SkinBtn::Init "$PLUGINSDIR\btn_agreement1.bmp"
		SkinBtn::Init "$PLUGINSDIR\btn_agreement2.bmp"
		SkinBtn::Init "$PLUGINSDIR\btn_close.bmp"
		SkinBtn::Init "$PLUGINSDIR\btn_cancel.bmp"
		SkinBtn::Init "$PLUGINSDIR\checkbox1.bmp"
		SkinBtn::Init "$PLUGINSDIR\checkbox2.bmp"
		SkinBtn::Init "$PLUGINSDIR\btn_quit.bmp"
		SkinBtn::Init "$PLUGINSDIR\btn_install.bmp"
		SkinBtn::Init "$PLUGINSDIR\btn_change.bmp"
		SkinBtn::Init "$PLUGINSDIR\btn_complete.bmp"

FunctionEnd

Function onGUIInit
    ;�����߿�
    System::Call `user32::SetWindowLong(i$HWNDPARENT,i${GWL_STYLE},0x9480084C)i.R0`
    ;����һЩ���пؼ�
    GetDlgItem $0 $HWNDPARENT 1034
    ShowWindow $0 ${SW_HIDE}
    GetDlgItem $0 $HWNDPARENT 1035
    ShowWindow $0 ${SW_HIDE}
    GetDlgItem $0 $HWNDPARENT 1036
    ShowWindow $0 ${SW_HIDE}
    GetDlgItem $0 $HWNDPARENT 1037
    ShowWindow $0 ${SW_HIDE}
    GetDlgItem $0 $HWNDPARENT 1038
    ShowWindow $0 ${SW_HIDE}
    GetDlgItem $0 $HWNDPARENT 1039
    ShowWindow $0 ${SW_HIDE}
    GetDlgItem $0 $HWNDPARENT 1256
    ShowWindow $0 ${SW_HIDE}
    GetDlgItem $0 $HWNDPARENT 1028
    ShowWindow $0 ${SW_HIDE}
FunctionEnd

;�����ޱ߿��ƶ�
Function onGUICallback
  ${If} $MSG = ${WM_LBUTTONDOWN}
    SendMessage $HWNDPARENT ${WM_NCLBUTTONDOWN} ${HTCAPTION} $0
  ${EndIf}
FunctionEnd

Function onWarningGUICallback
  ${If} $MSG = ${WM_LBUTTONDOWN}
    SendMessage $WarningForm ${WM_NCLBUTTONDOWN} ${HTCAPTION} $0
  ${EndIf}
FunctionEnd

;Э�鰴ť�¼�
Function onClickAgreement
	${IF} $Bool_License == 1
		ShowWindow $Txt_License ${SW_HIDE}
		ShowWindow $MiddleImage ${SW_SHOW}
		IntOp $Bool_License $Bool_License - 1
		StrCpy $1 $Btn_Agreement
		Call SkinBtn_Agreement1
	${ELSE}
	  ShowWindow $Txt_License ${SW_SHOW}
	  ShowWindow $MiddleImage ${SW_HIDE}
		IntOp $Bool_License $Bool_License + 1
		StrCpy $1 $Btn_Agreement
		Call SkinBtn_Agreement2
	${EndIf}
FunctionEnd

;-----------------------------------------Ƥ����ͼ����----------------------------------------------------
Function SkinBtn_Next
  SkinBtn::Set /IMGID=$PLUGINSDIR\btn_next.bmp $1
FunctionEnd

Function SkinBtn_Agreement1
  SkinBtn::Set /IMGID=$PLUGINSDIR\btn_agreement1.bmp $1
FunctionEnd

Function SkinBtn_Agreement2
  SkinBtn::Set /IMGID=$PLUGINSDIR\btn_agreement2.bmp $1
FunctionEnd

Function SkinBtn_Close
  SkinBtn::Set /IMGID=$PLUGINSDIR\btn_close.bmp $1
FunctionEnd

Function SkinBtn_Cancel
  SkinBtn::Set /IMGID=$PLUGINSDIR\btn_cancel.bmp $1
FunctionEnd

Function SkinBtn_Checked
  SkinBtn::Set /IMGID=$PLUGINSDIR\checkbox2.bmp $1
FunctionEnd

Function SkinBtn_UnChecked
  SkinBtn::Set /IMGID=$PLUGINSDIR\checkbox1.bmp $1
FunctionEnd

Function SkinBtn_Quit
  SkinBtn::Set /IMGID=$PLUGINSDIR\btn_quit.bmp $1
FunctionEnd

Function SkinBtn_Install
  SkinBtn::Set /IMGID=$PLUGINSDIR\btn_install.bmp $1
FunctionEnd

Function SkinBtn_Browser
  SkinBtn::Set /IMGID=$PLUGINSDIR\btn_change.bmp $1
FunctionEnd

Function SkinBtn_DetailsPrint1
  SkinBtn::Set /IMGID=$PLUGINSDIR\btn_installlist1.bmp $1
FunctionEnd

Function SkinBtn_DetailsPrint2
  SkinBtn::Set /IMGID=$PLUGINSDIR\btn_installlist2.bmp $1
FunctionEnd

Function SkinBtn_Complete
	SkinBtn::Set /IMGID=$PLUGINSDIR\btn_complete.bmp $1
FunctionEnd

Function OnClickQuitOK
	Call onClickClose
FunctionEnd

Function OnClick_CheckShortCut
  ${IF} $Bool_ShortCut == 1
		IntOp $Bool_ShortCut $Bool_ShortCut - 1
		StrCpy $1 $Ck_ShortCut
		Call SkinBtn_UnChecked
	${ELSE}
		IntOp $Bool_ShortCut $Bool_ShortCut + 1
		StrCpy $1 $Ck_ShortCut
		Call SkinBtn_Checked
	${EndIf}
FunctionEnd

Function OnClick_CheckAutoRun
  ${IF} $Bool_AutoRun == 1
		IntOp $Bool_AutoRun $Bool_AutoRun - 1
		StrCpy $1 $Ck_AutoRun
		Call SkinBtn_UnChecked
	${ELSE}
		IntOp $Bool_AutoRun $Bool_AutoRun + 1
		StrCpy $1 $Ck_AutoRun
		Call SkinBtn_Checked
	${EndIf}
FunctionEnd

Function OnClick_CheckFinishPage
  ${IF} $Bool_FinishPage == 1
		IntOp $Bool_FinishPage $Bool_FinishPage - 1
		StrCpy $1 $Ck_FinishPage
		Call SkinBtn_UnChecked
	${ELSE}
		IntOp $Bool_FinishPage $Bool_FinishPage + 1
		StrCpy $1 $Ck_FinishPage
		Call SkinBtn_Checked
	${EndIf}
FunctionEnd

;������Ͻǹرհ�ť
Function onClickClose
    FindProcDLL::FindProc "test.exe"
    Sleep 500
    Pop $R0
    ${If} $R0 != 0
    KillProcDLL::KillProc "test.exe"
    ${EndIf}
FunctionEnd

;����ҳ����ת������
Function RelGotoPage
  IntCmp $R9 0 0 Move Move
    StrCmp $R9 "X" 0 Move
      StrCpy $R9 "120"
  Move:
  SendMessage $HWNDPARENT "0x408" "$R9" ""
FunctionEnd

;��һ����ť�¼�
Function onClickNext
  StrCpy $R9 1 ;Goto the next page
  Call RelGotoPage
  Abort
FunctionEnd

;�����װ��ť
Function OnClick_Install
		EnableWindow $Btn_Install 0

    ShowWindow $Lbl_Sumary ${SW_SHOW}

	  ShowWindow $PPercent ${SW_SHOW}

    ShowWindow $PB_ProgressBar ${SW_SHOW}
		;��鰲װ����
		;Call CheckEnvironments
	
		${If} $ISMSI == 1
		  MessageBox MB_OK "msi"
	  	Call MSIInstallation32
		${EndIf}
		;�ж��Ƿ��Ѿ�װ��NF
	${If} $ISNETF == 1
		ReadRegStr $1 HKLM "Hardware\Description\System\CentralProcessor\0" Identifier
		StrCpy $2 $1 3
		${If} $2 == 'x86'
		  ;MessageBox MB_OK "net32"
			Call NFInstallation32
		${Else}
		  ;MessageBox MB_OK "net64"
			Call NFInstallation64
		${EndIf}
			MessageBox MB_OK "next"
	${EndIf}
	
	Call InstallationMainFun
		;��ת�����һҳ
		Call onClickNext
FunctionEnd

Function OnClick_Check
	;Call CheckEnvironments
	StrCpy $R9 1 ;Goto the next page
  Call RelGotoPage
  Abort
FunctionEnd

Function CheckEnvironments
	Call DiskCheck
	;���Windows Installer�汾�Ƿ����3.1
	Call MSIEnvironmentCheck
	;���.net framework 2.0 sp2�Ƿ�װ
	Call NFEnvironmentCheck
	;���VC 2008����
	;Call VCEnvironmentCheck
FunctionEnd


Function InstallationMainFun
	${NSD_SetText} $Lbl_Sumary "��������������..."
	${NSD_SetText} $PPercent "0%"

	inetc::get /hwnd $PPercent /hwnd2 $PPercent /probar $PB_ProgressBar /caption " " /popup "" "http://downloads.sourceforge.net/sevenzip/7z920_extra.7z" "$TEMP\7z920_extra.7z" /end
	Pop $0
	${If} $0 == "Transfer Error"
		MessageBox MB_ICONINFORMATION|MB_OK "���س���"
		Call onClickClose
		Abort
	${ELSEIF} $0 == "SendRequest Error"
		MessageBox MB_ICONINFORMATION|MB_OK "���س���"
		Call onClickClose
		Abort
	${ELSE}
		System::Call "user32::InvalidateRect(i $hwndparent,i0,i 1)"
		Call MAINInstall32
	${EndIf}
FunctionEnd

Function MAINInstall32
	${NSD_SetText} $Lbl_Sumary "���ڰ�װ������..."
	ShowWindow $PPercent ${SW_HIDE}
	SetOutPath $INSTDIR
	SetOverwrite on
	Nsis7z::Extract "$TEMP\7z920_extra.7z"
	Delete "$TEMP\7z920_extra.7z"
FunctionEnd

Function DiskCheck
    ;**********************************************************************************************
    ;���ڼ�鰲װ֮ǰ�ļ��
		;�ж�ϵͳ���ͣ�Win7+��ֻҪ�ж��Ƿ�װ��.net 2.0 sp2����
		;WinXP��Win2000��Win2003��Vista����Ҫװ.net 2.0 sp2������Vista sp1װ����.net 2.0 sp1���Բ����㡣
		;**********************************************************************************************
		ReadRegStr $0 HKLM 'SOFTWARE\Microsoft\Windows\CurrentVersion' CurrentVersion
		${If} $0 != ''
			MessageBox MB_ICONINFORMATION|MB_OK "$(LANGSTRING_WORNING_SYSTEMNTCHECK)"
			Abort
		${EndIf}

		ReadRegStr $0 HKLM 'SOFTWARE\Microsoft\Windows NT\CurrentVersion' CurrentVersion
		ReadRegStr $1 HKLM 'SOFTWARE\Microsoft\NET Framework Setup\NDP\v2.0.50727' Install
		ReadRegStr $2 HKLM 'SOFTWARE\Microsoft\NET Framework Setup\NDP\v2.0.50727' SP

		${If} $0 == '6.2'	;Win8
		${OrIf} $0 == '6.1'	;Win7
			  ;�ж��Ƿ�װ��.net framework 2.0 sp2
			  ${If} $1 == 1
			  ${AndIf} $2 == 2
						;Abort
				${Else}
				    Call DiskFrameWorkSpaceCheck
			  ${EndIf}
		${ElseIf} $0 == '6.0' ;WinVista
		${OrIf} $0 == '5.2'  ;Win2003
		${OrIf} $0 == '5.1'  ;WinXP
		${OrIf} $0 == '5.0'  ;Win2000
			;�ж��Ƿ�װ��.net framework 2.0 sp2
			${If} $1 == 1
			${AndIf} $2 == 2
				;Call DiskSpaceCheck
				;Abort
			${Else}
				Call DiskFrameWorkSpaceCheck
			${EndIf}
		${EndIf}

		;��鱾�����Ŀռ��С
		Call DiskProgramSpaceCheck
FunctionEnd

Function DiskFrameWorkSpaceCheck
	StrCpy $2 $INSTDIR 3
    ${DriveSpace}  "$2" "/D=F /S=M" $R0
    ReadRegStr $8 HKLM 'Hardware\Description\System\CentralProcessor\0' Identifier
    StrCpy $9 $8 3
    ${If} $9 == 'x86'
        ${If} $R0 < 280
			MessageBox MB_ICONINFORMATION|MB_OK ".net framework��װ�ռ䲻��"
			Abort
		${EndIf}
	${Else}
		${If} $R0 < 610
			MessageBox MB_ICONINFORMATION|MB_OK ".net framework��װ�ռ䲻��"
			Abort
		${EndIf}
	${EndIf}
FunctionEnd

;������С��50mb�ж�
Function DiskProgramSpaceCheck
	StrCpy $2 $INSTDIR 3
    ${DriveSpace}  "$2" "/D=F /S=M" $R0
	${If} $R0 < 10
		MessageBox MB_ICONINFORMATION|MB_OK "������װ�ռ䲻��"
		Abort
	${EndIf}
FunctionEnd

;MSI�������
Function MSIEnvironmentCheck
	ReadRegStr $0 HKLM 'SOFTWARE\Microsoft\Windows NT\CurrentVersion' CurrentVersion
	${If} $0 == '5.2'  ;Win2003
	${OrIf} $0 == '5.1'  ;WinXP
	${OrIf} $0 == '5.0'  ;Win2000
		GetDllVersion "$SYSDIR\msi.dll" $R0 $R1
		IntOp $R2 $R0 >> 16
		IntOp $R2 $R2 & 0x0000FFFF ; $R2 ���汾
		IntOp $R3 $R0 & 0x0000FFFF ; $R3 �ΰ汾
		IntOp $R4 $R1 >> 16
		IntOp $R4 $R4 & 0x0000FFFF ; $R4
		IntOp $R5 $R1 & 0x0000FFFF ; $R5
		StrCpy $0 "$R2.$R3.$R4.$R5" ; $0 now contains string like "1.2.0.192"
		${VersionCompare} $0 "3.1.4000.2435" $R0
		${If} $R0 == 2
			StrCpy $ISMSI 1
		${EndIf}
	${EndIf}
FunctionEnd

;����MSI
Function MSIInstallation32
	${NSD_SetText} $Lbl_Sumary "��������Microsoft Installer 3.1"
	ShowWindow $PPercent ${SW_SHOW} ;��ʾ��������
	${NSD_SetText} $PPercent "0%"

	;inetc::get /hwnd $MSIProcLB /hwnd2 $PPercent /probar $PB_ProgressBar /caption " " /popup "" "${BaseDownloadUrl}/WindowsInstaller-KB893803-v2-x86.exe" "$DOCUMENTS\WindowsInstaller-KB893803-v2-x86.exe"  /end
	inetc::get /hwnd $PPercent /hwnd2 $PPercent /probar $PB_ProgressBar /caption " " /popup "" "http://download.microsoft.com/download/1/4/7/147ded26-931c-4daf-9095-ec7baf996f46/WindowsInstaller-KB893803-v2-x86.exe" "$TEMP\WindowsInstaller-KB893803-v2-x86.exe"  /end
	Pop $0
	${If} $0 == "Transfer Error"
		MessageBox MB_ICONINFORMATION|MB_OK "���س���"
		Call onClickClose
		Abort
	${ELSEIF} $0 == "SendRequest Error"
		MessageBox MB_ICONINFORMATION|MB_OK "���س���"
		Call onClickClose
		Abort
	${ELSE}
		;ˢ�½���
		System::Call "user32::InvalidateRect(i $hwndparent,i0,i 1)"
		Call MSIInstall32
	${EndIf}
FunctionEnd

;��װMSI
Function MSIInstall32
	${NSD_SetText} $Lbl_Sumary "���ڰ�װMicrosoft Installer 3.1"
	ShowWindow $PPercent ${SW_HIDE}
	nsExec::ExecToStack '"$TEMP\WindowsInstaller-KB893803-v2-x86.exe" /quiet /norestart /overwriteoem"'
	Delete "$TEMP\WindowsInstaller-KB893803-v2-x86.exe"
FunctionEnd

;Frameworkƽ̨���
Function NFEnvironmentCheck
	ReadRegStr $1 HKLM "Hardware\Description\System\CentralProcessor\0" Identifier
	StrCpy $2 $1 3
	${If} $2 == 'x86'
		ReadRegStr $7 HKLM 'SOFTWARE\Microsoft\Windows NT\CurrentVersion' CurrentVersion
		ReadRegStr $8 HKLM 'SOFTWARE\Microsoft\NET Framework Setup\NDP\v2.0.50727' Install
		ReadRegStr $9 HKLM 'SOFTWARE\Microsoft\NET Framework Setup\NDP\v2.0.50727' SP
	${Else}
		SetRegView 64
		ReadRegStr $7 HKLM 'SOFTWARE\Microsoft\Windows NT\CurrentVersion' CurrentVersion
		ReadRegStr $8 HKLM 'SOFTWARE\Microsoft\NET Framework Setup\NDP\v2.0.50727' Install
		ReadRegStr $9 HKLM 'SOFTWARE\Microsoft\NET Framework Setup\NDP\v2.0.50727' SP
		SetRegView lastused
	${EndIf}

	${If} $7 == '6.2'	;Win8
	${OrIf} $7 == '6.1'	;Win7
		;�ж��Ƿ�װ��.net framework 2.0 sp2
		${If} $8 == 1
		${AndIf} $9 == 2

		${Else}
			;GetFunctionAddress $0 DisplayNFLabel
			;BgWorker::CallAndWait
			${If} $2 == 'x86'
				StrCpy $ISNETF 1
			${Else}
			  StrCpy $ISNETF 1
			${EndIf}
		${EndIf}

	${ElseIf} $7 == '6.0' ;WinVista
	${OrIf} $7 == '5.2'  ;Win2003
	${OrIf} $7 == '5.1'  ;WinXP
	${OrIf} $7 == '5.0'  ;Win2000
		;�ж��Ƿ�װ��.net framework 2.0 sp2
		${If} $8 == 1
		${AndIf} $9 == 2

		${Else}
			${If} $2 == 'x86'
				StrCpy $ISNETF 1
			${Else}
			  StrCpy $ISNETF 1
      ${EndIf}
		${EndIf}
	${EndIf}
FunctionEnd

Function NFInstallation32
	${NSD_SetText} $Lbl_Sumary "��������.net framework 2.0 sp2"
	ShowWindow $PPercent ${SW_SHOW} ;��ʾ��������
	${NSD_SetText} $PPercent "0%"

	;��ʼ����
	;inetc::get /caption "2006 report" /banner "Banner mode with /nocancel option setten$\nSecond Line" /nocancel "http://download.microsoft.com/download/c/6/e/c6e88215-0178-4c6c-b5f3-158ff77b1f38/NetFx20SP2_x86.exe" "$EXEDIR\NetFx20SP2_x86.exe" /end
	;inetc::get /hwnd $NFProcLB /hwnd2 $PPercent /probar $PB_ProgressBar /caption " " /popup "" "${BaseDownloadUrl}/NetFx20SP2_x86.exe" "$DOCUMENTS\NetFx20SP2_x86.exe"  /end
	inetc::get /hwnd $PPercent /hwnd2 $PPercent /probar $PB_ProgressBar /caption " " /popup "" "http://download.microsoft.com/download/c/6/e/c6e88215-0178-4c6c-b5f3-158ff77b1f38/NetFx20SP2_x86.exe" "$TEMP\NetFx20SP2_x86.exe"  /end
	Pop $0
	${If} $0 == "Transfer Error"
		Call onClickClose
		Abort
	${ELSEIF} $0 == "SendRequest Error"
		Call onClickClose
		Abort
	${ELSE}
		System::Call "user32::InvalidateRect(i $hwndparent,i0,i 1)"
		Call NFInstall32
	${EndIf}
FunctionEnd

Function NFInstallation64
	${NSD_SetText} $Lbl_Sumary "��������.net framework 2.0 sp2"
	ShowWindow $PPercent ${SW_SHOW} ;��ʾ��������
	${NSD_SetText} $PPercent "0%"
		  ;MessageBox MB_OK "net641111111"
	;��ʼ����
	;inetc::get /hwnd $NFProcLB /hwnd2 $PPercent /probar $PB_ProgressBar /caption " " /popup "" "${BaseDownloadUrl}/NetFx20SP2_x64.exe" "$DOCUMENTS\NetFx20SP2_x64.exe"  /end
	inetc::get /hwnd $PPercent /hwnd2 $PPercent /probar $PB_ProgressBar /caption " " /popup "" "http://download.microsoft.com/download/c/6/e/c6e88215-0178-4c6c-b5f3-158ff77b1f38/NetFx20SP2_x64.exe" "$TEMP\NetFx20SP2_x64.exe"  /end
	Pop $0
	${If} $0 == "Transfer Error"
	  ;MessageBox MB_OK "net64err"
		Call onClickClose
		Abort
	${ELSEIF} $0 == "SendRequest Error"
		;MessageBox MB_OK "net64err2"
		Call onClickClose
		Abort
	${ELSE}
		;System::Call "user32::InvalidateRect(i $hwndparent,i0,i 1)"
		Call NFInstall64
	${EndIf}
FunctionEnd

Function NFInstall64
	${NSD_SetText} $Lbl_Sumary "���ڰ�װ.net framework 2.0 sp2"
	;MessageBox MB_OK "net64inst"
	ShowWindow $PPercent ${SW_HIDE}
	;ShowWindow
	nsExec::ExecToStack '"$TEMP\NetFx20SP2_x64.exe" /q /c:"install.exe /noaspupgrade /q"'
	Pop $0
	${If} $0 == "timeout"
		Call onClickClose
		Abort
	${EndIf}
	;MessageBox MB_OK "net64inst2"
	${If} $0 == "error"
	  	;MessageBox MB_OK "net64inst1111111"
		Call onClickClose
		Abort
	${EndIf}

	Delete "$TEMP\NetFx20SP2_x64.exe"
FunctionEnd
Function NFInstall32
	${NSD_SetText} $Lbl_Sumary "���ڰ�װ.net framework 2.0 sp2"
	ShowWindow $PPercent ${SW_HIDE}
	nsExec::ExecToStack '"$TEMP\NetFx20SP2_x86.exe" /q /c:"install.exe /noaspupgrade /q"'
	Pop $0
	${If} $0 == "timeout"
		Call onClickClose
		Abort
	${EndIf}
	${If} $0 == "error"
		Call onClickClose
		Abort
	${EndIf}

	Delete "$TEMP\NetFx20SP2_x86.exe"
FunctionEnd


Function OnClickQuitCancel
  ${NSW_DestroyWindow} $WarningForm
  EnableWindow $hwndparent 1
  BringToFront
FunctionEnd

Function onCancel
	IsWindow $WarningForm Create_End
	!define Style ${WS_VISIBLE}|${WS_OVERLAPPEDWINDOW}
	${NSW_CreateWindowEx} $WarningForm $hwndparent ${ExStyle} ${Style} "" 1018

	${NSW_SetWindowSize} $WarningForm 349 184
	EnableWindow $hwndparent 0
	System::Call `user32::SetWindowLong(i$WarningForm,i${GWL_STYLE},0x9480084C)i.R0`
	${NSW_CreateButton} 148 122 88 25 ''
	Pop $R0
	StrCpy $1 $R0
	Call SkinBtn_Quit
	${NSW_OnClick} $R0 OnClickQuitOK

	${NSW_CreateButton} 248 122 88 25 ''
	Pop $R0
	StrCpy $1 $R0
	Call SkinBtn_Cancel
	${NSW_OnClick} $R0 OnClickQuitCancel

	${NSW_CreateBitmap} 0 0 100% 100% ""
  	Pop $BGImage
  ${NSW_SetImage} $BGImage $PLUGINSDIR\quit.bmp $ImageHandle
	GetFunctionAddress $0 onWarningGUICallback
	WndProc::onCallback $BGImage $0 ;�����ޱ߿����ƶ�
  ${NSW_CenterWindow} $WarningForm $hwndparent
	${NSW_Show}
	Create_End:
  ShowWindow $WarningForm ${SW_SHOW}
FunctionEnd

;����Ŀ¼�¼�
Function OnChange_DirRequest
	;Pop $0
	;System::Call "user32::GetWindowText($Txt_Browser,t.r0,i${NSIS_MAX_STRLEN})"
	;StrCpy $INSTDIR $0
FunctionEnd

Function OnClick_BrowseButton
  Pop $0

  Push $INSTDIR ; input string "C:\Program Files\ProgramName"
  Call GetParent
  Pop $R0 ; first part "C:\Program Files"

  Push $INSTDIR ; input string "C:\Program Files\ProgramName"
  Push "\" ; input chop char
  Call GetLastPart
  Pop $R1 ; last part "ProgramName"

  nsDialogs::SelectFolderDialog "��ѡ�� $R0 ��װ���ļ���:" "$R0"
  Pop $0
  ${If} $0 == "error" # returns 'error' if 'cancel' was pressed?
    Return
  ${EndIf}
  ${If} $0 != ""
    StrCpy $INSTDIR "$0\$R1"
    system::Call `user32::SetWindowText(i $Txt_Browser, t "$INSTDIR")`
  ${EndIf}
FunctionEnd
; Usage:
; Push "C:\Program Files\Directory\Whatever"
; Call GetParent
; Pop $R0 ; $R0 equal "C:\Program Files\Directory"
;�õ�ѡ��Ŀ¼����ƴ�Ӱ�װ��������
Function GetParent
  Exch $R0 ; input string
  Push $R1
  Push $R2
  Push $R3
  StrCpy $R1 0
  StrLen $R2 $R0
  loop:
    IntOp $R1 $R1 + 1
    IntCmp $R1 $R2 get 0 get
    StrCpy $R3 $R0 1 -$R1
    StrCmp $R3 "\" get
    Goto loop
  get:
    StrCpy $R0 $R0 -$R1
    Pop $R3
    Pop $R2
    Pop $R1
    Exch $R0 ; output string
FunctionEnd

; Usage:
; Push $INSTDIR ; input string "C:\Program Files\ProgramName"
; Push "\" ; input chop char
; Call GetLastPart
; Pop $R1 ; last part "ProgramName"
;��ȡѡ��Ŀ¼
Function GetLastPart
  Exch $0 ; chop char
  Exch
  Exch $1 ; input string
  Push $2
  Push $3
  StrCpy $2 0
  loop:
    IntOp $2 $2 - 1
    StrCpy $3 $1 1 $2
    StrCmp $3 "" 0 +3
      StrCpy $0 ""
      Goto exit2
    StrCmp $3 $0 exit1
    Goto loop
  exit1:
    IntOp $2 $2 + 1
    StrCpy $0 $1 "" $2
  exit2:
    Pop $3
    Pop $2
    Pop $1
    Exch $0 ; output string
FunctionEnd

;��ϸ��װ�¼�
Function onClickDetailsPrint
    ${IF} $Bool_DetailsPrint == 1
        ShowWindow $WebImg ${SW_SHOW}
		ShowWindow $Txt_DetailsPrint ${SW_HIDE}
		IntOp $Bool_DetailsPrint $Bool_DetailsPrint - 1
		StrCpy $1 $Btn_DetailsPrint
		Call SkinBtn_DetailsPrint1
	${ELSE}
        ShowWindow $WebImg ${SW_HIDE}
        ShowWindow $Txt_DetailsPrint ${SW_SHOW}
		IntOp $Bool_DetailsPrint $Bool_DetailsPrint + 1
		StrCpy $1 $Btn_DetailsPrint
		Call SkinBtn_DetailsPrint2
	${EndIf}
FunctionEnd

Function NSD_TimerFun
    GetFunctionAddress $0 NSD_TimerFun
    nsDialogs::KillTimer $0
    !if 1   ;�Ƿ��ں�̨����,1��Ч
        GetFunctionAddress $0 CheckEnvironments
        BgWorker::CallAndWait
    !else
        Call CheckEnvironments
    !endif
FunctionEnd

Function OnClick_CheckWeibo
    ${IF} $Bool_Weibo == 1
        IntOp $Bool_Weibo $Bool_Weibo - 1
        StrCpy $1 $Ck_Weibo
        Call SkinBtn_UnChecked
    ${ELSE}
        IntOp $Bool_Weibo $Bool_Weibo + 1
        StrCpy $1 $Ck_Weibo
        Call SkinBtn_Checked
    ${EndIf}
FunctionEnd

;���������
Function onClickComplete

    ;�ж��Ƿ���������ݷ�ʽ
    ${If} $Bool_ShortCut == 1
      ;CreateShortCut "$DESKTOP\${PRODUCT_NAME}.lnk" "$INSTDIR\test.exe"
    ${EndIf}
    ;�ж��Ƿ񿪻����г���
    ${If} $Bool_AutoRun == 1
      ;CreateShortCut "$QUICKLAUNCH\${PRODUCT_NAME}.lnk" "$INSTDIR\${PRODUCT_EXECUTE_NAME}"
      ;CreateShortCut "$SMSTARTUP\${PRODUCT_NAME}.lnk" "$INSTDIR\${PRODUCT_EXECUTE_NAME}"
    ${EndIf}
    ;�ж��Ƿ����վ
    ${If} $Bool_FinishPage == 1
        ExecShell open "http://hamletsoft.com"
    ${EndIf}
    ;�ж��Ƿ��������г���
    ${If} $Bool_Weibo == 1
      ExecShell open "http://weibo.com/pylife"
      ShowWindow $HWNDPARENT ${SW_HIDE}
      GetFunctionAddress $0 onClickClose
      BgWorker::CallAndWait
		${ELSE}
		  ShowWindow $HWNDPARENT ${SW_HIDE}
      Call onClickClose
    ${EndIf}
FunctionEnd

Function WelcomePage
    GetDlgItem $0 $HWNDPARENT 1
    ShowWindow $0 ${SW_HIDE}
    GetDlgItem $0 $HWNDPARENT 2
    ShowWindow $0 ${SW_HIDE}
    GetDlgItem $0 $HWNDPARENT 3
    ShowWindow $0 ${SW_HIDE}

    nsDialogs::Create 1044
    Pop $0
    ${If} $0 == error
        Abort
    ${EndIf}
    SetCtlColors $0 ""  transparent ;�������͸��

    ${NSW_SetWindowSize} $HWNDPARENT 513 354 ;�ı䴰���С
    ${NSW_SetWindowSize} $0 513 354 ;�ı�Page��С

    ;��ȡRTF���ı���
		nsDialogs::CreateControl "RichEdit20A" \
    ${ES_READONLY}|${WS_VISIBLE}|${WS_CHILD}|${WS_TABSTOP}|${WS_VSCROLL}|${ES_MULTILINE}|${ES_WANTRETURN} \
		${WS_EX_STATICEDGE}  5 35 501 216 ''
    Pop $Txt_License
		${LoadRTF} '$PLUGINSDIR\license.rtf' $Txt_License
    ShowWindow $Txt_License ${SW_HIDE}


    ;��һ��
    ${NSD_CreateButton} 320 315 88 25 ""
		Pop $Btn_Next
		StrCpy $1 $Btn_Next
		Call SkinBtn_Next
		GetFunctionAddress $3 onClickNext
    SkinBtn::onClick $1 $3

    	;ȡ��
	${NSD_CreateButton} 417 315 88 25 ""
	Pop $Btn_Cancel
	StrCpy $1 $Btn_Cancel
	Call SkinBtn_Cancel
	GetFunctionAddress $3 onCancel
  SkinBtn::onClick $1 $3

    ;�رհ�ť
  ${NSD_CreateButton} 490 8 15 15 ""
	Pop $Btn_Close
	StrCpy $1 $Btn_Close
	Call SkinBtn_Close
  GetFunctionAddress $3 onCancel
  SkinBtn::onClick $1 $3

    ;�û�Э��
		${NSD_CreateButton} 181 273 95 15 ""
		Pop $Btn_Agreement
		StrCpy $1 $Btn_Agreement
		Call SkinBtn_Agreement1
	  GetFunctionAddress $3 onClickAgreement
	  SkinBtn::onClick $1 $3
 		StrCpy $Bool_License 0 ;��ʼ��ֵΪ0

    ;��Сͼ
    ${NSD_CreateBitmap} 1 31 511 226 ""
    Pop $MiddleImage
    ${NSD_SetImage} $MiddleImage $PLUGINSDIR\welcome.bmp $ImageHandle
    ;ShowWindow $MiddleImage ${SW_HIDE}

    ;��������ͼ
    ${NSD_CreateBitmap} 0 0 100% 100% ""
    Pop $BGImage
    ${NSD_SetImage} $BGImage $PLUGINSDIR\bg.bmp $ImageHandle

	GetFunctionAddress $0 onGUICallback
	WndProc::onCallback $BGImage $0 ;�����ޱ߿����ƶ�
	nsDialogs::Show
	${NSD_FreeImage} $ImageHandle
FunctionEnd

Function InstallationPage
  GetDlgItem $0 $HWNDPARENT 1
  ShowWindow $0 ${SW_HIDE}
  GetDlgItem $0 $HWNDPARENT 2
  ShowWindow $0 ${SW_HIDE}
  GetDlgItem $0 $HWNDPARENT 3
  ShowWindow $0 ${SW_HIDE}

	nsDialogs::Create 1044
	Pop $0
	${If} $0 == error
		Abort
	${EndIf}
	SetCtlColors $0 ""  transparent ;�������͸��

	${NSW_SetWindowSize} $HWNDPARENT 520 350 ;�ı��Զ��崰���С
	${NSW_SetWindowSize} $0 520 350 ;�ı��Զ���Page��С

	;����Ŀ¼�ؼ�����
	${NSD_CreateDirRequest} 26 79 358 25 "$INSTDIR"
 	Pop	$Txt_Browser
 	${NSD_OnChange} $Txt_Browser OnChange_DirRequest

 	${NSD_CreateBrowseButton} 400 79 88 25 ""
 	Pop	$Btn_Browser
 	StrCpy $1 $Btn_Browser
	Call SkinBtn_Browser
	GetFunctionAddress $3 OnClick_BrowseButton
  SkinBtn::onClick $1 $3

	;CheckBoxѡ����
	${NSD_CreateButton} 26 150 15 15 ""
	Pop $Ck_ShortCut
	StrCpy $1 $Ck_ShortCut
	Call SkinBtn_Checked
	GetFunctionAddress $3 OnClick_CheckShortCut
    SkinBtn::onClick $1 $3
	StrCpy $Bool_ShortCut 1
    ${NSD_CreateLabel} 45 151 100 15 "��������ݷ�ʽ"
    Pop $Lbl_ShortCut
    SetCtlColors $Lbl_ShortCut ""  transparent ;�������͸��

    ${NSD_CreateButton} 26 180 15 15 ""
	Pop $Ck_AutoRun
	StrCpy $1 $Ck_AutoRun
	Call SkinBtn_Checked
	GetFunctionAddress $3 OnClick_CheckAutoRun
    SkinBtn::onClick $1 $3
	StrCpy $Bool_AutoRun 1
    ${NSD_CreateLabel} 45 181 175 15 "�����Զ����г���"
    Pop $Lbl_AutoRun
    SetCtlColors $Lbl_AutoRun ""  transparent ;�������͸��

  ${NSD_CreateButton} 26 210 15 15 ""
	Pop $Ck_FinishPage
	StrCpy $1 $Ck_FinishPage
	Call SkinBtn_Checked
	GetFunctionAddress $3 OnClick_CheckFinishPage
  SkinBtn::onClick $1 $3
	StrCpy $Bool_FinishPage 1
  ${NSD_CreateLabel} 45 211 300 15 "��װ��Ϻ���ò˵���վhttp://www.pylife.net"
  Pop $Lbl_FinishPage
  SetCtlColors $Lbl_FinishPage ""  transparent ;�������͸��

    ;��װ
    ${NSD_CreateButton} 320 315 88 25 ""
		Pop $Btn_Next
		StrCpy $1 $Btn_Next
		Call SkinBtn_Next
		GetFunctionAddress $3 OnClick_Check
	  SkinBtn::onClick $1 $3

    	;ȡ��
		${NSD_CreateButton} 417 315 88 25 ""
		Pop $Btn_Cancel
		StrCpy $1 $Btn_Cancel
		Call SkinBtn_Cancel
		GetFunctionAddress $3 onCancel
	  SkinBtn::onClick $1 $3

    ;�رհ�ť
  ${NSD_CreateButton} 490 8 15 15 ""
	Pop $Btn_Close
	StrCpy $1 $Btn_Close
	Call SkinBtn_Close
  GetFunctionAddress $3 onCancel
  SkinBtn::onClick $1 $3

  ;��������ͼ
	${NSD_CreateBitmap} 0 0 100% 100% ""
  	Pop $BGImage
  ${NSD_SetImage} $BGImage $PLUGINSDIR\select.bmp $ImageHandle


	GetFunctionAddress $0 onGUICallback
	WndProc::onCallback $BGImage $0 ;�����ޱ߿����ƶ�
	nsDialogs::Show
	${NSD_FreeImage} $ImageHandle
FunctionEnd

;��װ����ҳ��
Function LoadingPage
  GetDlgItem $0 $HWNDPARENT 1
  ShowWindow $0 ${SW_HIDE}
  GetDlgItem $0 $HWNDPARENT 2
  ShowWindow $0 ${SW_HIDE}
  GetDlgItem $0 $HWNDPARENT 3
  ShowWindow $0 ${SW_HIDE}

	nsDialogs::Create 1044
	Pop $0
	${If} $0 == error
		Abort
	${EndIf}
	SetCtlColors $0 ""  transparent ;�������͸��

	${NSW_SetWindowSize} $HWNDPARENT 520 350 ;�ı��Զ��崰���С
	${NSW_SetWindowSize} $0 520 350 ;�ı��Զ���Page��С

    ;Details����ı���
    StrCpy $UDetailsPrint "��ʼִ�а�װ$\r$\nhttp://www.eastmoney.com$\r$\n"
    nsDialogs::CreateControl EDIT "${__NSD_Text_STYLE}|${WS_VSCROLL}|${ES_MULTILINE}|${ES_WANTRETURN}" "${__NSD_Text_EXSTYLE}" 10 44 500 200 $UDetailsPrint
    Pop $Txt_DetailsPrint
    ShowWindow $Txt_DetailsPrint ${SW_HIDE}
    StrCpy $Bool_DetailsPrint 0


    ;������Ҫ˵��
    ${NSD_CreateLabel} 24 243 300 20 "���ڰ�װ"
    Pop $Lbl_Sumary
    SetCtlColors $Lbl_Sumary ""  0xffffff ;�������͸��
    ShowWindow $Lbl_Sumary ${SW_HIDE}

        ;������Ҫ˵��
    ${NSD_CreateLabel} 490 243 30 20 "0%"
    Pop $PPercent
    SetCtlColors $PPercent ""  0xffffff
	  ShowWindow $PPercent ${SW_HIDE}

    ${NSD_CreateProgressBar} 24 265 474 7 ""
    Pop $PB_ProgressBar
    SkinProgress::Set $PB_ProgressBar "$PLUGINSDIR\loading2.bmp" "$PLUGINSDIR\loading1.bmp"
    ShowWindow $PB_ProgressBar ${SW_HIDE}

    GetFunctionAddress $0 NSD_TimerFun
    nsDialogs::CreateTimer $0 1

    ;��һ��
    ${NSD_CreateButton} 320 315 88 25 ""
    Pop $Btn_Next
    StrCpy $1 $Btn_Next
    Call SkinBtn_Next
    GetFunctionAddress $3 onClickNext
    SkinBtn::onClick $1 $3
    ShowWindow $Btn_Next ${SW_HIDE}

    ;��װ
    ${NSD_CreateButton} 320 315 88 25 ""
		Pop $Btn_Install
		StrCpy $1 $Btn_Install
		Call SkinBtn_Install
		GetFunctionAddress $3 OnClick_Install
    SkinBtn::onClick $1 $3

    	;ȡ��
		${NSD_CreateButton} 417 315 88 25 ""
		Pop $Btn_Cancel
		StrCpy $1 $Btn_Cancel
		Call SkinBtn_Cancel
		GetFunctionAddress $3 onCancel
	  SkinBtn::onClick $1 $3
		  ;EnableWindow $Btn_Cancel 1

    ;�رհ�ť
	  ${NSD_CreateButton} 490 8 15 15 ""
		Pop $Btn_Close
		StrCpy $1 $Btn_Close
		Call SkinBtn_Close
	  GetFunctionAddress $3 onCancel
	  SkinBtn::onClick $1 $3
	  ;EnableWindow $Btn_Close 0

    System::Call `*(i,i,i,i)i(1,34,518,200).R0`
    System::Call `user32::MapDialogRect(i$HWNDPARENT,iR0)`
    System::Call `*$R0(i.s,i.s,i.s,i.s)`
    System::Free $R0
    FindWindow $R0 "#32770" "" $HWNDPARENT
    System::Call `user32::CreateWindowEx(i,t"STATIC",in,i${DEFAULT_STYLES}|${SS_BLACKRECT},i1,i34,i518,i200,iR0,i1100,in,in)i.R0`
    StrCpy $WebImg $R0
    WebCtrl::ShowWebInCtrl $WebImg "$PLUGINSDIR/index.htm"

    ;��������ͼ
    ${NSD_CreateBitmap} 0 0 100% 100% ""
    Pop $BGImage
    ${NSD_SetImage} $BGImage $PLUGINSDIR\installation.bmp $ImageHandle

    GetFunctionAddress $0 onGUICallback
    WndProc::onCallback $BGImage $0 ;�����ޱ߿����ƶ�
    nsDialogs::Show
    ${NSD_FreeImage} $ImageHandle
FunctionEnd

Function CompletePage
    GetDlgItem $0 $HWNDPARENT 1
    ShowWindow $0 ${SW_HIDE}
    GetDlgItem $0 $HWNDPARENT 2
    ShowWindow $0 ${SW_HIDE}
    GetDlgItem $0 $HWNDPARENT 3
    ShowWindow $0 ${SW_HIDE}

    nsDialogs::Create 1044
    Pop $0
	${If} $0 == error
		Abort
	${EndIf}
	SetCtlColors $0 ""  transparent ;�������͸��

    ${NSW_SetWindowSize} $HWNDPARENT 520 350 ;�ı��Զ��崰���С
	${NSW_SetWindowSize} $0 520 350 ;�ı��Զ���Page��С

	${NSD_CreateButton} 255 163 15 15 ""
	Pop $Ck_Weibo
	StrCpy $1 $Ck_Weibo
	Call SkinBtn_Checked
	GetFunctionAddress $3 OnClick_CheckWeibo
    SkinBtn::onClick $1 $3
	StrCpy $Bool_Weibo 1
    ${NSD_CreateLabel} 273 163 300 15 "�ף���һ����,http://weibo.com/pylife"
    Pop $Lbl_Weibo
    SetCtlColors $Lbl_Weibo "" transparent ;�������͸��

	;�رհ�ť
  ${NSD_CreateButton} 495 10 15 15 ""
	Pop $Btn_Close
	StrCpy $1 $Btn_Close
	Call SkinBtn_Close
  GetFunctionAddress $3 onClickComplete
  SkinBtn::onClick $1 $3

  ;���
  ${NSD_CreateButton} 417 303 88 25 ""
	Pop $Btn_Complete
	StrCpy $1 $Btn_Complete
	Call SkinBtn_Complete
    GetFunctionAddress $2 onClickComplete
  SkinBtn::onClick $1 $2

	;��������ͼ
	${NSD_CreateBitmap} 0 0 100% 100% ""
  	Pop $BGImage
    ${NSD_SetImage} $BGImage $PLUGINSDIR\success.bmp $ImageHandle

	GetFunctionAddress $0 onGUICallback
    WndProc::onCallback $BGImage $0 ;�����ޱ߿����ƶ�
    nsDialogs::Show
    ${NSD_FreeImage} $ImageHandle
FunctionEnd

;-------------------------------------------------------------------------------------------------------------

Section MainSetup
SectionEnd
