FormatTime, TimeString, R
FileAppend,,%A_ScriptDir%\Script_Log.txt
FileAppend,,%A_ScriptDir%\UserRequests.txt
FileAppend,,%A_ScriptDir%\CrushLog.txt
FileAppend,,%A_ScriptDir%\Logs Reports.txt
IfExist, %A_ScriptDir%\Script_Log.txt
{
	FileAppend,###########################################################################################################################[%TimeString%]#########`n, %A_ScriptDir%\Script_Log.txt
	FileAppend,[%TimeString%] (Запуск %A_ScriptName%)[1].[SUCCES] -Успешно.`n, %A_ScriptDir%\Script_Log.txt
	FileAppend,[%TimeString%] (Завершение процессов)[1] Запущен поиск лишних процессов.`n, %A_ScriptDir%\Script_Log.txt
	FileAppend,[%TimeString%] (Поиск Файлов отчетов скрипта)[1] Запущен поиск файлов отчетов скрипта.`n, %A_ScriptDir%\Script_Log.txt
	IfExist, %A_ScriptDir%\UserRequests.txt
	{
		FileAppend,[%TimeString%] (Поиск Файлов отчетов скрипта)[1] файл UserRequests.txt был найден`n, %A_ScriptDir%\Script_Log.txt
	}
	IfNotExist, %A_ScriptDir%\UserRequests.txt

	{
		FileAppend,[%TimeString%] (Поиск Файлов отчетов скрипта)[0] файл UserRequests.txt не был найден, создание`n, %A_ScriptDir%\Script_Log.txt
		FileAppend,[%TimeString%] (Поиск Файлов отчетов скрипта)[0] файл UserRequests.txt не был найден, создание`n, %A_ScriptDir%\CrushLog.txt
	}
	
	IfExist, %A_ScriptDir%\CrushLog.txt
	{
		FileAppend,[%TimeString%] (Поиск Файлов отчетов скрипта)[1] файл UserRequests.txt был найден`n, %A_ScriptDir%\Script_Log.txt
	}
	IfNotExist, %A_ScriptDir%\CrushLog.txt
	{
		FileAppend,[%TimeString%] (Поиск Файлов отчетов скрипта)[0] файл CrushLog.txt не был найден, создание`n, %A_ScriptDir%\Script_Log.txt
		FileAppend,[%TimeString%] (Поиск Файлов отчетов скрипта)[0] файл UserRequests.txt не был найден, создание`n, %A_ScriptDir%\CrushLog.txt
	}
	
	IfExist, %A_ScriptDir%\Logs Reports.txt
	{
		FileAppend,[%TimeString%] (Поиск Файлов отчетов скрипта)[1] файл Logs Reports.txt был найден`n, %A_ScriptDir%\Script_Log.txt
	}
	IfNotExist, %A_ScriptDir%\Logs Reports.txt
	{
		FileAppend,[%TimeString%] (Поиск Файлов отчетов скрипта)[0] файл Logs Reports.txt не был найден, создание`n, %A_ScriptDir%\Script_Log.txt
		FileAppend,[%TimeString%] (Поиск Файлов отчетов скрипта)[0] файл UserRequests.txt не был найден, создание`n, %A_ScriptDir%\CrushLog.txt
	}
}

IfNotExist, %A_ScriptDir%\Script_Log.txt
{
	Loop
	{
		FileAppend,,%A_ScriptDir%\Script_Log.txt
		IfExist, %A_ScriptDir%\Script_Log.txt
		{
			break
		}
		IfNotExist, %A_ScriptDir%\Script_Log.txt
		{
			MsgBox, Ошибка создания файла отчетов программы
			FileAppend,[%TimeString%] (Создание файла отчетов, по запросам пользователя)[0] Ошибка. Файл не создан.`n,%A_ScriptDir%\CrushLog.txt
		}
	}
	return
}

IfNotExist, %A_ScriptDir%\UserRequests.txt
{
	Loop
	{
		FileAppend,,%A_ScriptDir%\UserRequests.txt
		IfExist, %A_ScriptDir%\UserRequests.txt
		{
			break
		}
		IfNotExist, %A_ScriptDir%\UserRequests.txt
		{	
			FileAppend,[%TimeString%] (Создание файла отчетов, по запросам пользователя)[0] Ошибка. Файл не создан.`n,%A_ScriptDir%\CrushLog.txt
			MsgBox, Ошибка создания файла отчетов программы
		}
	}
	return
}

IfNotExist, %A_ScriptDir%\CrushLog.txt
{
	Loop
	{
		FileAppend,,%A_ScriptDir%\CrushLog.txt
		IfExist, %A_ScriptDir%\CrushLog.txt
		{
			break
		}
		IfNotExist, %A_ScriptDir%\CrushLog.txt
		{	
			FileAppend,[%TimeString%] (Создание файла отчетов, по запросам пользователя( UserRequests ))[0] Ошибка. Файл не создан.`n,%A_ScriptDir%\CrushLog.txt
			FileAppend,[%TimeString%] (Создание файла отчетов, по запросам пользователя( Script_Log ))[0] Ошибка. Файл не создан.`n,%A_ScriptDir%\CrushLog.txt
		}
	}
	return
}

IfNotExist, %A_ScriptDir%\Logs Reports.txt
{
	Loop
	{
		FileAppend,,%A_ScriptDir%\Logs Reports.txt
		IfExist, %A_ScriptDir%\Logs Reports.txt
		{
			break
		}
		IfNotExist, %A_ScriptDir%\Logs Reports.txt
		{	
			FileAppend,[%TimeString%] (Создание файла отчетов, по запросам пользователя( UserRequests ))[0] Ошибка. Файл не создан.`n,%A_ScriptDir%\CrushLog.txt
			FileAppend,[%TimeString%] (Создание файла отчетов, по запросам пользователя( Script_Log ))[0] Ошибка. Файл не создан.`n,%A_ScriptDir%\CrushLog.txt
		}
	}
	return
}

Process, wait,hamachi-2-ui.exe, 5.5
NewPID = %ErrorLevel%  
if NewPID = 0
{
	FileAppend,[%TimeString%] (Завершение_процесса %NewPID%)[0].[ERROR] Процесс не обнаружен после ожидания в 5.5 секунд.`n, %A_ScriptDir%\Script_Log.txt
    return
}
FileAppend,[%TimeString%] (Завершение_процесса %NewPID%)[1] Процесс обнаружен.`n, %A_ScriptDir%\Script_Log.txt
Process, priority, %NewPID%, Low
FileAppend,[%TimeString%] (Завершение_процесса %NewPID%[1] Процессу %NewPID% задан низкий приоритет.`n, %A_ScriptDir%\Script_Log.txt
Process, priority, , High  
FileAppend,[%TimeString%] (Завершение_процесса %NewPID%)[1] Скрипту задан высокий приоритет.`n, %A_ScriptDir%\Script_Log.txt
FileAppend,[%TimeString%] (Завершение_процесса %NewPID%)[1] Ожидание завершения.`n, %A_ScriptDir%\Script_Log.txt
WinClose Untitled - Hamachi
FileAppend,[%TimeString%] (Завершение_процесса %NewPID%)[1] Задано время ожидания завершения процесса (1 секунда).`n, %A_ScriptDir%\Script_Log.txt
Process, WaitClose, %NewPID%, 1
if ErrorLevel ; The PID still exists.
{
	FileAppend,[%TimeString%] (Завершение_процесса %NewPID%)[0] Процесс не был завершен по истечению 1 секунда.`n, %A_ScriptDir%\Script_Log.txt
	FileAppend,[%TimeString%] (Завершение_процесса %NewPID%)[1] Экстренное завершение`n, %A_ScriptDir%\Script_Log.txt
	Process, close, %NewPID%
	if ErrorLevel
	{
		FileAppend,[%TimeString%] (Завершение_процесса %NewPID%)[1].[SUCCESS] Процесс успешно завершен.`n, %A_ScriptDir%\Script_Log.txt
	}
}

+Numpad7::
+NumpadHome::
{
	MsgBox, 4,,Рассписание будет загруженно и открыто.
	FileAppend,[%TimeString%] (ЗАГРУЗКА raspisanie.xls)[1] Пользовательский запрос на загрузку файла raspisanie.xls.`n, %A_ScriptDir%\Script_Log.txt
	IfMsgBox Yes
	{	
		FileAppend,[%TimeString%] (ЗАГРУЗКА raspisanie.xls)[1] Действие подтверждено пользователем.`n, %A_ScriptDir%\Script_Log.txt
		IfExist, D:\опера загрузки\raspisanie.xls
		{	
			FileAppend,[%TimeString%] (ЗАГРУЗКА raspisanie.xls)[1] Был найден более старый файл.`n, %A_ScriptDir%\Script_Log.txt
			FileAppend,[%TimeString%] (ЗАГРУЗКА raspisanie.xls)[1] Запрос на замену файла.`n, %A_ScriptDir%\Script_Log.txt
			MsgBox, 4,,Был найден более старый файл. Заменить на новый?
			IfMsgBox Yes
			{	
				FileAppend,[%TimeString%] (ЗАГРУЗКА raspisanie.xls)[1] Будет произедена замена файла.`n, %A_ScriptDir%\Script_Log.txt
				FileDelete, D:\опера загрузки\raspisanie.xls
				IfNotExist D:\опера загрузки\raspisanie.xls
				{
					FileAppend,[%TimeString%] (ЗАГРУЗКА raspisanie.xls)[1] Загрузка файла.`n, %A_ScriptDir%\Script_Log.txt
					run www.apgta.ru/images/kategorii/Raspisanie_Zanyatiy/raspisanie.xls     ;скачивание рассписания занятий
					Loop
					{
						IfExist, D:\опера загрузки\raspisanie.xls
						{
							FileAppend,[%TimeString%] (ЗАГРУЗКА raspisanie.xls)[1] Файл загружен.`n, %A_ScriptDir%\Script_Log.txt
							run D:\опера загрузки\raspisanie.xls  
							FileAppend,[%TimeString%] (РАБОТА с raspisanie.xls)[1] Файл открыт.`n, %A_ScriptDir%\Script_Log.txt
							Sleep, 1000 ; 1 секунда.
							FileAppend,[%TimeString%] (РАБОТА с raspisanie.xls)[1] Запрос на удаление файла.`n, %A_ScriptDir%\Script_Log.txt
							MsgBox, 4,, Загруженный файл будет удален, для корректной работы программы, для отмены нажмите "Нет", для продолжения закройте файл, затем в нажмите "Да".
							IfMsgBox Yes
							{	
								FileAppend,[%TimeString%] (РАБОТА с raspisanie.xls)[1] Удаление подтверждено.`n, %A_ScriptDir%\Script_Log.txt
								FileDelete, D:\опера загрузки\raspisanie.xls
								FileAppend,[%TimeString%] (РАБОТА с raspisanie.xls)[1](1d) Файл удален`n, %A_ScriptDir%\Script_Log.txt
								IfExist, D:\опера загрузки\raspisanie.xls
								{
									Loop
									{
										FileDelete, D:\опера загрузки\raspisanie.xls
										FileAppend,[%TimeString%] (РАБОТА с raspisanie.xls)[1]  Ошибка удаления файла`n, %A_ScriptDir%\Script_Log.txt
										FileAppend,[%TimeString%] (РАБОТА с raspisanie.xls)[1] Повтор удаления файла`n, %A_ScriptDir%\Script_Log.txt
										FileAppend,[%TimeString%] (РАБОТА с raspisanie.xls)[1](2d) Файл удален.`n, %A_ScriptDir%\Script_Log.txt
										break
									}
									return
								}
								IfNotExist, D:\опера загрузки\raspisanie.xls
								{
									msgBox Файл успешно удален.
									FileAppend,[%TimeString%] (РАБОТА с raspisanie.xls)[1] Файл не найден, удаление прошло успешно.`n, %A_ScriptDir%\Script_Log.txt
								}
								return
							}
							IfMsgBox No 
							{
								FileAppend,[%TimeString%] (РАБОТА с raspisanie.xls)[1] Отмена Удаления.`n, %A_ScriptDir%\Script_Log.txt
								MsgBox Файл не будет тронут, для последующик загрузок, следует произвести его удаление.
							}
							break
						}
					}					
				}
			}
			IfMsgBox No
			{
				FileAppend,[%TimeString%] (ЗАГРУЗКА raspisanie.xls)[1] Замена отменена.`n, %A_ScriptDir%\Script_Log.txt
				MsgBox Действие отменено, файл не будет загружен
			}
		} 
		
		IfNotExist, D:\опера загрузки\raspisanie.xls
		{
			FileAppend,[%TimeString%] (ЗАГРУЗКА raspisanie.xls)[1] Файл не найден.`n, %A_ScriptDir%\Script_Log.txt
			FileAppend,[%TimeString%] (ЗАГРУЗКА raspisanie.xls)[1] Загрузка.`n, %A_ScriptDir%\Script_Log.txt
			run www.apgta.ru/images/kategorii/Raspisanie_Zanyatiy/raspisanie.xls     ;скачивание рассписания занятий
			Loop
			{
				IfExist, D:\опера загрузки\raspisanie.xls
				{	
					FileAppend,[%TimeString%] (ЗАГРУЗКА raspisanie.xls)[1] Файл загружен.`n, %A_ScriptDir%\Script_Log.txt
					run D:\опера загрузки\raspisanie.xls  
					FileAppend,[%TimeString%] (ЗАГРУЗКА raspisanie.xls)[1] Файл открыт.`n, %A_ScriptDir%\Script_Log.txt
					Sleep, 1000 ; 1 секунда.
					MsgBox, 4,, Загруженный файл будет удален, для корректной работы программы, для отмены нажмите "Нет", для продолжения закройте файл, затем в нажмите "Да".
					FileAppend,[%TimeString%] (РАБОТА с raspisanie.xls)[1] Запрос на удаление файла.`n, %A_ScriptDir%\Script_Log.txt
					IfMsgBox Yes
					{
						FileAppend,[%TimeString%] (РАБОТА с raspisanie.xls)[1] Удаление подтверждено.`n, %A_ScriptDir%\Script_Log.txt
						FileDelete, D:\опера загрузки\raspisanie.xls
						FileAppend,[%TimeString%] (РАБОТА с raspisanie.xls)[1](1d) Файл удален`n, %A_ScriptDir%\Script_Log.txt
						IfExist, D:\опера загрузки\raspisanie.xls
						{
							Loop
							{
								FileDelete, D:\опера загрузки\raspisanie.xls
								FileAppend,[%TimeString%] (РАБОТА с raspisanie.xls)[1]  Ошибка удаления файла`n, %A_ScriptDir%\Script_Log.txt
								FileAppend,[%TimeString%] (РАБОТА с raspisanie.xls)[1] Повтор удаления файла`n, %A_ScriptDir%\Script_Log.txt
								FileAppend,[%TimeString%] (РАБОТА с raspisanie.xls)[1](2d) Файл удален.`n, %A_ScriptDir%\Script_Log.txt
								break
							}
							return
						}
						IfNotExist, D:\опера загрузки\raspisanie.xls
						{
							msgBox Файл успешно удален.
							FileAppend,[%TimeString%] (РАБОТА с raspisanie.xls)[1] Файл не найден, удаление прошло успешно.`n, %A_ScriptDir%\Script_Log.txt
						}
						return
					}
					IfMsgBox No 
					{
						FileAppend,[%TimeString%] (РАБОТА с raspisanie.xls)[1] Файл не будет тронут.`n, %A_ScriptDir%\Script_Log.txt
						MsgBox Файл не будет тронут, для последующик загрузок, следует произвести его удаление.
					}
					break
				}
			}
		}
	}
	return
}
return

+Numpad8::
+NumpadUp::
{
	MsgBox, 4,,Изменения будут загруженны и открыты.
	FileAppend,[%TimeString%] (ЗАГРУЗКА zameni.doc)[1] Пользовательский запрос на загрузку файла zameni.doc.`n, %A_ScriptDir%\Script_Log.txt
	IfMsgBox Yes
	{
		FileAppend,[%TimeString%] (ЗАГРУЗКА zameni.doc)[1] Действие подтверждено пользователем.`n, %A_ScriptDir%\Script_Log.txt
		IfExist, D:\опера загрузки\zameni.doc
		{
			MsgBox, 4,,Был найден более старый файл. Заменить на новый?
			FileAppend,[%TimeString%] (ЗАГРУЗКА zameni.doc)[1] Был найден более старый файл.`n, %A_ScriptDir%\Script_Log.txt
			FileAppend,[%TimeString%] (ЗАГРУЗКА zameni.doc)[1] Запрос на замену файла.`n, %A_ScriptDir%\Script_Log.txt
			IfMsgBox Yes
			{
				FileAppend,[%TimeString%] (ЗАГРУЗКА zameni.doc)[1] Будет произедена замена файла.`n, %A_ScriptDir%\Script_Log.txt
				FileDelete, D:\опера загрузки\zameni.doc
				IfNotExist D:\опера загрузки\zameni.doc
				{	
					FileAppend,[%TimeString%] (ЗАГРУЗКА zameni.doc)[1] Загрузка файла.`n, %A_ScriptDir%\Script_Log.txt
					run www.apgta.ru/images/kategorii/Raspisanie_Zanyatiy/zameni.doc     ;скачивание изменений в рассписании занятий
					Loop
					{
						IfExist, D:\опера загрузки\zameni.doc
						{	
							FileAppend,[%TimeString%] (РАБОТА с zameni.doc)[1] Файл загружен.`n, %A_ScriptDir%\Script_Log.txt
							run D:\опера загрузки\zameni.doc 
							FileAppend,[%TimeString%] (РАБОТА с zameni.doc)[1] Файл открыт.`n, %A_ScriptDir%\Script_Log.txt
							Sleep, 1000 ; 1 секунда.
							FileAppend,[%TimeString%] (РАБОТА с zameni.doc)[1] Запрос на удаление файла.`n, %A_ScriptDir%\Script_Log.txt
							MsgBox, 4,, Загруженный файл будет удален, для корректной работы программы, для отмены нажмите "Нет", для продолжения- обязательно ЗАКРОЙТЕ файл, затем в нажмите "Да".
							IfMsgBox Yes
							{	
								FileAppend,[%TimeString%] (РАБОТА с zameni.doc)[1] Удаление подтверждено.`n, %A_ScriptDir%\Script_Log.txt
								FileDelete, D:\опера загрузки\zameni.doc
								FileAppend,[%TimeString%] (РАБОТА с zameni.doc)[1](1d) Файл удален.`n, %A_ScriptDir%\Script_Log.txt
								IfExist, D:\опера загрузки\zameni.doc
								{
									Loop
									{
										FileAppend,[%TimeString%] (РАБОТА с zameni.doc)[1]  Ошибка удаления файла`n, %A_ScriptDir%\Script_Log.txt
										FileAppend,[%TimeString%] (РАБОТА с zameni.doc)[1] Повтор удаления файла`n, %A_ScriptDir%\Script_Log.txt
										FileAppend,[%TimeString%] (РАБОТА с zameni.doc)[1](2d) Файл удален.`n, %A_ScriptDir%\Script_Log.txt
										Sleep, 1000 ; 1 секунда 
										FileDelete, D:\опера загрузки\zameni.doc
										msgBox Файл успешно удален.
										IfNotExist, D:\опера загрузки\zameni.doc
										{
											FileAppend,[%TimeString%] (РАБОТА с zameni.doc)[1]  Удаление прошло успешно.`n, %A_ScriptDir%\Script_Log.txt
											msgBox Файл успешно удален.
											break
										}
										return
									}
								}
							}
							IFmsgBox No
							{
								FileAppend,[%TimeString%] (РАБОТА с zameni.doc)[1]  Удаление отменено.`n, %A_ScriptDir%\Script_Log.txt
								MsgBox Файл не будет тронут, для последующик загрузок, следует произвести его удаление.
							}
							break
						}
					}
				}
			}
			return
		} 
		IfNotExist, D:\опера загрузки\zameni.doc
		{
			FileAppend,[%TimeString%] (ЗАГРУЗКА zameni.doc)[1] Файл не найден.`n, %A_ScriptDir%\Script_Log.txt
			FileAppend,[%TimeString%] (ЗАГРУЗКА zameni.doc)[1] Загрузка.`n, %A_ScriptDir%\Script_Log.txt
			run www.apgta.ru/images/kategorii/Raspisanie_Zanyatiy/zameni.doc     ;скачивание рассписания занятий
			Loop
			{
				IfExist, D:\опера загрузки\zameni.doc
				{
					FileAppend,[%TimeString%] (РАБОТА с zameni.doc)[1] Файл загружен.`n, %A_ScriptDir%\Script_Log.txt
					run D:\опера загрузки\zameni.doc 
					FileAppend,[%TimeString%] (РАБОТА с zameni.doc)[1] Файл открыт.`n, %A_ScriptDir%\Script_Log.txt
					Sleep, 1000 ; 1 секунда.
					FileAppend,[%TimeString%] (РАБОТА с zameni.doc)[1] Запрос на удаление файла.`n, %A_ScriptDir%\Script_Log.txt
					MsgBox, 4,, Загруженный файл будет удален, для корректной работы программы, для отмены нажмите "Нет", для продолжения- обязательно ЗАКРОЙТЕ файл, затем в нажмите "Да".
					IfMsgBox Yes
					{	
						FileAppend,[%TimeString%] (РАБОТА с zameni.doc)[1] Удаление протверждено.`n, %A_ScriptDir%\Script_Log.txt
						FileDelete, D:\опера загрузки\zameni.doc
						FileAppend,[%TimeString%] (РАБОТА с zameni.doc)[1](1d) Файл удален.`n, %A_ScriptDir%\Script_Log.txt
						msgBox Файл успешно удален.
						IfExist, D:\опера загрузки\zameni.doc
						{
							FileDelete, D:\опера загрузки\zameni.doc
							FileAppend,[%TimeString%] (РАБОТА с zameni.doc)[1](2d) Файл удален.`n, %A_ScriptDir%\Script_Log.txt
							msgBox Файл успешно удален.
							IfNotExist, D:\опера загрузки\zameni.doc
							{	
								FileAppend,[%TimeString%] (РАБОТА с  zameni.doc)[1](2d[1]) Файл удален.`n, %A_ScriptDir%\Script_Log.txt
								msgBox Файл успешно удален.
							}
							return
						}
					}
					IFmsgBox No
					{	
						FileAppend,[%TimeString%] (ЗАГРУЗКА zameni.doc)[1](2d) Удаление отменено.`n, %A_ScriptDir%\Script_Log.txt
						IfExist, D:\опера загрузки\raspisanie.xls
						{
							MsgBox Файл не будет тронут, для последующик загрузок, следует произвести его удаление.
						}
					}
					break
				}
			}
		}
	}
	return
}
return

+Numpad0::
+NumpadIns::
{
	FileRecycleEmpty
	msgBox Recycle has been cleared.                                         ;очистка корзины
	FileAppend,[%TimeString%] ((HOOK) [+Numpad0 | +NumpadIns] )[1]   Recycle hes been cleared.`n, %A_ScriptDir%\Script_Log.txt
}
return

#WheelUp::
{
	SoundSet +5
	SoundSet, +5, wave                                                       ;+звук
}
return

#WheelDown::                                           					     ;-звук
{
	SoundSet -5
	SoundSet, -5, wave
}
return

#Numpad0::                                   					             ;выкл звук
#NumpadIns::
{
	SoundSet 0
	SoundSet, 0, wave
}
return

#Numpad1::                                                                   ;вкл звук
#NumpadEnd::
{
	SoundSet 100
	SoundSet, 100, wave
}
return

+NumpadAdd::                                                                 ;запустить редоктор кода скрипта
{
	MsgBox, 4,, Would you like to edit script?
	IfMsgBox Yes
	{
		run notepad++, %A_ScriptDir%\%A_ScriptName%
	}
}
return
+NumPad2::
+NumPadDown::
{
	InputBox, UserInput, Send command to script, Input your command here, , 230, 130
	NewStr := StrReplace(UserInput, A_Space, "+")
	if UserInput != ""
	{
		Run, opera.exe https://www.google.com/search?safe=active&q=%NewStr%
	}
	
	if UserInput= help ; список команнд скрипта
	{
		msgBox,
		(
			СПИСОК КОМАНД
		===============================
		cll - очистка файлов отчетов скрипта
		lg - открытие файла отчетов скрипта
		sdir - открытие папки скрипта
		help - список команнд скрипта
		===============================
		)
	}
	if UserInput=cll ; очистка файлов отчетов скрипта
	{
		FileDelete, %A_ScriptDir%\Script_Log.txt
		FileAppend,,%A_ScriptDir%\Script_Log.txt
		IfExist %A_ScriptDir%\Script_Log.txt
		{
			msgBox, log cleared.
		}
	}
	if UserInput=lg ; открытие файла отчетов скрипта
	{
		Run, %A_ScriptDir%\Script_Log.txt
	}
	if UserInput=sdir ; открытие папки скрипта
	{
		run,%A_ScriptDir%
	}
}

return
+Numpad3::
+NumpadPgDn::
{	
Run, %A_ScriptDir%\Script_Log.txt
	//WinActivate %comspec%
	//ifWinExist %comspec%
//    {
//		WinActivate %comspec%
//	  }
//	  IfWinNotExist %comspec%
	//	{
		//run, %comspec% /k chcp&&chcp&&chcp&&chcp&&chcp&&chcp&&chcp
		//WinActivate %comspec%
		//Clipboard = type C:\Users\hyptexxx3\Desktop\Scripts_AHK\Script_Log.txt &&  echo off | clip
		//SendInput, %Clipboard%
	//  }
}
return

+NumPadEnter::                                                               ;список горячих клавиш(справка)
{
	msgBox,
	(
		СПИСОК ГОРЯЧИХ КЛАВИШ
		===============================
		Shift+NumPad0(Ins) - очистка корзины
		Shift+NumPad+ - редактирование скрипта
		Shift+NumPad7(Home) - скачать рассписание
		Shift+NumPad8(Up) - скачать изменения в рассписании
		Win+NumPad1(End) - максимальная громкость звука
		Win+NumPad0(Ins) - выключить звук
		Win+WheelUp(колесико вверх) - громкость звука +5
		Win+WheelDown(колесико вниз) - громкость звука -5
		Shift+NumPadEnter(Enter) - вызов справки
		Shift+NumPad3(PgDn) - открыть файл отчетов скрипта


		===============================
	)	
}
return

WheelDown::
  if GetKeyState("XButton2", "P")
  {
    Click up
    Send, ^{vk58}        ; Ctrl-X, вырезать.
    Quit=1
  }
  else Send, {WheelDown}
Exit

!vk43 ::                                                                       ;перевод выделенного текста
{
	FileAppend,[%TimeString%] (Запрос на перевод)[1] Запрос на перевод.`n,%A_ScriptDir%\UserRequests.txt
	Send, ^{vk43}
	MsgBox, 4,, 
	(
		запрос на перевод

		%clipboard%
	)
	IfMsgBox yes
	{
		FileAppend,[%TimeString%] (Запрос на перевод)[1] Действие подтверждено пользователем.`n,%A_ScriptDir%\UserRequests.txt
		FileAppend,[%TimeString%] (Запрос на перевод)[1] содержимое:`n,%A_ScriptDir%\UserRequests.txt
		FileAppend,[%TimeString%] (Запрос на перевод)[1]==============================================================================================================`n,%A_ScriptDir%\UserRequests.txt
		FileAppend,[%TimeString%]                       = %clipboard%`n,%A_ScriptDir%\UserRequests.txt
		FileAppend,[%TimeString%] (Запрос на перевод)[1]==============================================================================================================`n,%A_ScriptDir%\UserRequests.txt
		run https://translate.google.ru
		sleep 3000
		Send, ^{vk56} 
		
	}
	IfmsgBox no
	{
		FileAppend,[%TimeString%] (Запрос на перевод)[0] Действие отклонено пользователем.`n,%A_ScriptDir%\UserRequests.txt
		return
	}
}
return

$^+vk43::
{
	_gl_BUFF = %clipboard%
	Send, ^{vk43}
	_NEW_BUFF = %clipboard%
}
return

$^+vk56::
{
	%clipboard%=_NEW_BUFF
}
return

!vk47::                                                                       ;перевод выделенного текста 
{
	FileAppend,[%TimeString%] (Запрос на поиск)[1] Запрос на поиск.`n,%A_ScriptDir%\UserRequests.txt

	Send, ^{vk43}
	MsgBox, 4,, 
	(
		запрос на поиск
		
		%clipboard%
	)
	IfMsgBox yes
	{
		FileAppend,[%TimeString%] (Запрос на поиск)[1] Действие подтверждено пользователем.`n,%A_ScriptDir%\UserRequestsV
		FileAppend,[%TimeString%] (Запрос на поиск)[1] содержимое:`n,%A_ScriptDir%\UserRequests.txt
		FileAppend,[%TimeString%] (Запрос на поиск)[1]==============================================================================================================`n,%A_ScriptDir%\UserRequests.txt
		FileAppend,[%TimeString%]                     = %clipboard%`n,%A_ScriptDir%\UserRequests.txt
		FileAppend,[%TimeString%] (Запрос на поиск)[1]==============================================================================================================`n,%A_ScriptDir%\UserRequests.txt
		run www.google.ru
		sleep 3000
		Send, ^{vk56} 
		sleep,1000
		
	}
	IfmsgBox no
	{
		FileAppend,[%TimeString%] (Запрос на поиск)[0] Действие отклонено пользователем.`n,%A_ScriptDir%\UserRequests.txt
		return
	}
}
return
												/*======================FOR NOTES==========================================FOR NOTES*/
												/*               Send, {VK_RETURN}         ENTER button click emulation             */
												/*                                                                                  */
												/*                                                                                  */
												/*                                                                                  */
												/*                                                                                  */
												/*                                                                                  */
												/*======================FOR NOTES===================================================*/