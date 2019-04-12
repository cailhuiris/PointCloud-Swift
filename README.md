# $P Recognizer 논문을 참조하여 모바일에서 모양 인식 하는 애플리케이션 구현
그린 그림이 어떤 글자와 일치하는지 비교하여 정답을 알려준다. 'T'를 손으로 그리면 이 그림은 알파벳 T라고 결과가 나타남.

# Algorithm.
$P-Recognizer는 인식하고자 하는 모양을 미리 Point Cloud 데이터 형태로 저장한 뒤 내가 새로 그린 그림의 데이터랑 비교하여 가장 유사한 모양을 찾는 방법으로 구현한다. (자세한 방법과 의사코드는 아래 레퍼런스를 참조)

### Reference
[$P Recognizer - University of Washington](https://depts.washington.edu/aimgroup/proj/dollar/pdollar.html)
