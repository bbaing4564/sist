package exercise.io;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

public class GawiBawiBoGame {

	private InputStream is; // 입력 스트림 객체
	private int input; // 입력 값 저장
	private final StringBuilder MAIN_MENU; // 메인 메뉴 목록
	private final StringBuilder GAME_MENU; // 게임 메뉴 목록

	// 기본 생성자 오버로딩
	// 메뉴 메소드 호출
	GawiBawiBoGame() throws IOException {

		// 메인 메뉴 목록
		MAIN_MENU = new StringBuilder();
		GAME_MENU = new StringBuilder();

		// >가위 바위 보 게임
		// 1. 컴퓨터 vs. 사람
		// 2. 사람 vs. 사람 (준비중)
		// 3. 순위 보기 (준비중)
		// 4. 종료

		MAIN_MENU.append("> 가위 바위 보 게임!!\n");
		MAIN_MENU.append("  1. 사람  vs 컴퓨터\n");
		MAIN_MENU.append("  2. 사람  vs 사람(준비중)\n");
		MAIN_MENU.append("  3. 순위 보기 (준비중)\n");
		MAIN_MENU.append("  4. 종료\n");
		MAIN_MENU.append("> 선택: ");

		GAME_MENU.append("\n  컴퓨터와 가위 바위 보!\n");
		GAME_MENU.append("  (가위 = 0, 바위 = 1, 보 = 2)\n");
		GAME_MENU.append("> 입력 : ");

		System.out.println("이름을 입력하세요 : ");
		showMenu(); // 메뉴 메소드 호출
	}

	// 메뉴 출력 메소드
	public void showMenu() throws IOException {
		System.out.print(MAIN_MENU); // 메뉴 출력

		while (true) {
			input = is.read(); // 값 하나 입력받기

			switch (input) {
			case 13:
				continue;
			case 10:
				continue; // CR, LF 처리
			case '1':
				playGame();
				break;
			case '2':
				System.out.println("준비중 입니다.");
				System.out.print(MAIN_MENU);
				break;
			case '3':
				System.out.println("준비중 입니다.");
				System.out.print(MAIN_MENU);
				break;
			case '4':
				System.out.println("> 프로그램을 종료합니다.");
				System.exit(0);
				break;
			default:
				System.out.println("	1 ~ 4 중에 선택해 주세요.");
				showMenu();
				break;
			}// End case
		} // End while
	}// End showMenu

	public void playGame() throws IOException {

//		// [사람] 가위 : 바위 [컴퓨터]
//		// you lose
//		// > 계속 하시겠습니까? ( Y / N )
		System.out.print(GAME_MENU); // 게임 메뉴 출력
		int com = (int) (Math.random() * 3); // 컴퓨터가 내는 수
		InputStream is = System.in;
		GAME: while (true) {
			input = is.read(); // 값 하나 입력받기
			switch (input) {
			case 13:
				continue;
			case 10:
				continue; // CR, LF 처리
			case '0':
			case '1':
			case '2':
				if (input == '0')
					System.out.print("[사람] 가위  :");
				else if (input == '1')
					System.out.print("[사람] 바위  :");
				else if (input == '2')
					System.out.print("[사람] 보  :");
				else {
					System.out.println("알맞은 값을 입력해주세요");
					break;
				}

				if (com == 0)
					System.out.println(" 가위  [컴퓨터]");
				else if (com == 1)
					System.out.println(" 바위  [컴퓨터]");
				else
					System.out.println(" 보  [컴퓨터]");
				System.out.println();
				System.out.println("----- 결과  -----");

				if ((input - 48) == com) {
					System.out.println("    " + "비겼습니다.");
					break;
				} else if (((input - 48) - com == -2) || ((input - 48) - com == 1)) {
					System.out.println("  " + "you win!!!");
					break;
				} else {
					System.out.println("  " + "you lose!!!");
					break;
				}
			default: {
				System.out.print(" 0, 1, 2 중 하나를 선택해 주세요. : ");
				continue;
			}

			}// End case
			System.out.println("계속 하시겠습니까? ( Y / N )");
			while (true) {
				input = is.read();
				switch (input) {
				case 13:
					continue;
				case 10:
					continue;
				case 'y':
				case 'Y':
					playGame();
				case 'n':
				case 'N':
					showMenu();
					break;
				default:
					System.out.print("Y(y) 혹은 N(n)을 입력해주세요. : ");
					break;
				}
			}
		} // End while

	}// End startGame

	public static void main(String[] args) throws IOException {
		new GawiBawiBoGame();
	}

}
