import turtle as t
import random
import time

# 구분선 및 게임 결과 표시용 터틀틀
divider_turtle = t.Turtle()
game_turtle = t.Turtle()
title_turtle = t.Turtle()

# 모든 거북이 기본 설정
all_turtles = [divider_turtle, game_turtle, title_turtle]
for turtle_obj in all_turtles:
    turtle_obj.hideturtle()
    turtle_obj.speed(0)
    turtle_obj.penup()

# 구분선 그리기 함수
def draw_dividers():
    divider_turtle.pensize(2)
    
    # 세로 구분선 왼쪽
    divider_turtle.penup()
    divider_turtle.goto(-300, 250)
    divider_turtle.pendown()
    divider_turtle.goto(-300, -220)
    
    # 세로 구분선 오른쪽
    divider_turtle.penup()
    divider_turtle.goto(300, 250)
    divider_turtle.pendown()
    divider_turtle.goto(300, -220)
    
# 글씨 쓰기 함수
def write_text(turtle_obj, text, position, font_size=24, align="center", color="black"):
    turtle_obj.penup()
    turtle_obj.goto(position)
    turtle_obj.pencolor(color)
    turtle_obj.write(text, align=align, font=("Arial", font_size, "bold"))
    turtle_obj.pencolor("black")  # 색상 초기화

# 게임 결과 판정 함수
def determine_winner(player_choice, computer_choice):
    if player_choice == computer_choice:
        return "무승부!"
    elif (player_choice == "가위" and computer_choice == "보") or \
         (player_choice == "바위" and computer_choice == "가위") or \
         (player_choice == "보" and computer_choice == "바위"):
        return "플레이어 승리!"
    else:
        return "컴퓨터 승리!"

# 게임 결과 표시 함수
def display_game(x_pos, game_number):
    choices = ["가위", "바위", "보"]
    
    # 랜덤 선택
    player_choice = random.choice(choices)
    computer_choice = random.choice(choices)
    
    # 게임 번호 표시
    write_text(game_turtle, f"게임 #{game_number}", (x_pos, 220), 28)
    
    # 플레이어와 컴퓨터 레이블
    write_text(game_turtle, "플레이어", (x_pos - 110, 180), 20)
    write_text(game_turtle, "컴퓨터", (x_pos + 110, 180), 20)
    
    # 결과 판정
    result = determine_winner(player_choice, computer_choice)
    
    # 선택 결과 표시 (승자는 빨간색으로)
    if result == "플레이어 승리!":
        write_text(game_turtle, player_choice, (x_pos - 110, 100), 40, color="red")
        write_text(game_turtle, computer_choice, (x_pos + 110, 100), 40)
    elif result == "컴퓨터 승리!":
        write_text(game_turtle, player_choice, (x_pos - 110, 100), 40)
        write_text(game_turtle, computer_choice, (x_pos + 110, 100), 40, color="red")
    else:  # 무승부
        write_text(game_turtle, player_choice, (x_pos - 110, 100), 40)
        write_text(game_turtle, computer_choice, (x_pos + 110, 100), 40)
    
    # VS 표시
    write_text(game_turtle, "VS", (x_pos, 100), 24)
    
    # 결과 표시
    write_text(game_turtle, "결과", (x_pos, 0), 20)
    write_text(game_turtle, result, (x_pos, -40), 24)
    
    # 구분선 (게임 결과 구분)
    if game_number < 3:  # 마지막 게임이 아닐 경우에만
        game_turtle.penup()
        game_turtle.goto(x_pos + 225, 250)
        game_turtle.pendown()
        game_turtle.pensize(1)
        game_turtle.goto(x_pos + 225, -220)

# 제목 표시
write_text(title_turtle, "가위바위보 게임 - 3회 결과", (0, 280), 36)

# 세 번의 게임 실행 및 결과 표시
display_game(-450, 1)  # 왼쪽 영역
display_game(0, 2)     # 가운데 영역
display_game(450, 3)   # 오른쪽 영역

# 종료 안내 메시지
write_text(title_turtle, "게임이 종료되었습니다", (0, -250), 16)
time.sleep(10)