class Story {
  String storyTitle;
  String choice1;
  String choice2;

  Story({required this.storyTitle, required this.choice1, required this.choice2});
}

class StoryBrain {
  int _storyNumber = 0;

  final List<Story> _storyData = [
    Story(
      storyTitle:
      'Xe của bạn bị nổ lốp trên một con đường vắng giữa núi, không có sóng điện thoại. Bạn quyết định xin đi nhờ xe. Một chiếc bán tải cũ dừng lại. Người đàn ông đội mũ rộng vành với ánh mắt lạnh lẽo mở cửa và hỏi: "Cần đi nhờ không nhóc?".',
      choice1: 'Lên xe, cảm ơn vì đã giúp!',
      choice2: 'Hỏi thẳng ông ta có phải sát nhân không.',
    ),
    Story(
      storyTitle: 'Ông ta gật đầu chậm rãi, không hề tỏ ra bất ngờ.',
      choice1: 'Ít ra ông ta cũng thành thật. Lên xe thôi.',
      choice2: 'Thôi, mình tự thay lốp vậy.',
    ),
    Story(
      storyTitle:
      'Trên đường đi, ông ta bắt đầu kể về mối quan hệ với mẹ và ngày càng tức giận. Ông ta bảo bạn mở hộp đồ phía trước. Bên trong có một con dao dính máu, hai ngón tay bị cắt và một cuộn băng nhạc. Ông ta đưa tay về phía hộp.',
      choice1: 'Đưa ông ta cuộn băng nhạc.',
      choice2: 'Không còn cách nào! Bạn cầm dao chống lại.',
    ),
    Story(
      storyTitle:
      'Kết thúc khá nhạt! Bạn có biết tai nạn giao thông là một trong những nguyên nhân gây tử vong hàng đầu không?',
      choice1: 'Chơi lại',
      choice2: '',
    ),
    Story(
      storyTitle:
      'Bạn mất lái và lao xuống vực. Có lẽ việc tấn công tài xế khi xe đang chạy không phải ý hay...',
      choice1: 'Chơi lại',
      choice2: '',
    ),
    Story(
      storyTitle:
      'Bạn và ông ta trở nên thân thiết khi cùng nghe nhạc. Ông ta thả bạn ở thị trấn kế tiếp và hỏi nơi phi tang xác. Bạn chỉ về phía bến tàu...',
      choice1: 'Chơi lại',
      choice2: '',
    ),
  ];

  String getStory() => _storyData[_storyNumber].storyTitle;

  String getChoice1() => _storyData[_storyNumber].choice1;

  String getChoice2() => _storyData[_storyNumber].choice2;

  void nextStory(int choiceNumber) {
    if (_storyNumber == 0) {
      _storyNumber = (choiceNumber == 1) ? 2 : 1;
    } else if (_storyNumber == 1) {
      _storyNumber = (choiceNumber == 1) ? 2 : 3;
    } else if (_storyNumber == 2) {
      _storyNumber = (choiceNumber == 1) ? 5 : 4;
    } else {
      restart();
    }
  }

  void restart() {
    _storyNumber = 0;
  }

  bool buttonShouldBeVisible() {
    return _storyNumber <= 2;
  }
}