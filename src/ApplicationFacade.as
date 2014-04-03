/**
 * Copyright (c) 2011-2012 Alexandr Albul
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package {

import controller.ExitCommand;
import controller.FinishGameCommand;
import controller.NewGameCommand;
import controller.PuzzleClickCommand;
import controller.ShowAboutCommand;
import controller.ShowChoiceGameCommand;
import controller.ShowMainMenuCommand;
import controller.ShowRecordsCommand;
import controller.StartupCommand;

import flash.display.DisplayObject;

import org.puremvc.as3.interfaces.IFacade;
import org.puremvc.as3.patterns.facade.Facade;

public class ApplicationFacade extends Facade implements IFacade {

	public static const CMD_STARTUP:String = "cmdStartup";          // Запуск приложения
	public static const CMD_NEW_GAME:String = "cmdNewGame";         // Создание новой игры
	public static const CMD_PUZZLE_CLICK:String = "cmdPuzzleClick"; // Клик по пазлу
	public static const CMD_FINISH:String = "cmdFinish";            // Завершить игру
	public static const CMD_EXIT:String = "cmdExit";                // Выход из игры

	public static const SHOW_MAIN_MENU:String = "showMainMenu";     // Показать главное меню
	public static const SHOW_CHOICE_GAME:String = "showChoiceGame"; // Показать меню выбора игры
	public static const SHOW_RECORDS:String = "showRecords";		// Показать меню "рекорды"
	public static const SHOW_ABOUT:String = "showAbout";			// Показать меню "об игре"

	public static const STAGE_RESIZE:String = "stageResize";		// Сцена изменила размер
	public static const PUZZLES_CREATED:String = "puzzlesCreated";	// Матрица пазлов создана
	public static const PUZZLES_CHANGED:String = "puzzlesChanged";	// Матрица изменилась
	public static const TIME_UPDATED:String = "timeUpdated";		// Время игры обновлено

	public static function getInstance():ApplicationFacade {
		if (instance == null) instance = new ApplicationFacade();
		return instance as ApplicationFacade;
	}

	public function startup(root:DisplayObject):void {
//        notifyObservers(new Notification(CMD_STARTUP, root));
		sendNotification(CMD_STARTUP, root);
	}

	override protected function initializeController():void {
		super.initializeController();
		registerCommand(CMD_STARTUP, StartupCommand);
		registerCommand(CMD_NEW_GAME, NewGameCommand);
		registerCommand(CMD_FINISH, FinishGameCommand);
		registerCommand(CMD_PUZZLE_CLICK, PuzzleClickCommand);
		registerCommand(CMD_EXIT, ExitCommand);
		registerCommand(SHOW_ABOUT, ShowAboutCommand);
		registerCommand(SHOW_MAIN_MENU, ShowMainMenuCommand);
		registerCommand(SHOW_CHOICE_GAME, ShowChoiceGameCommand);
		registerCommand(SHOW_RECORDS, ShowRecordsCommand);
	}
}
}
