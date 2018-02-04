class ResultsController < ApplicationController
  
  require 'active_support'
  
  def index
    @test2s = Test2.where(test_num: params[:test_num])
    @all_answer_num = @test2s.length
    @right_answer_num = countRightAnswers(@test2s)
    # 秒数が帰ってくる
    sec = @test2s[@all_answer_num - 1].end_datetime.to_i - @test2s[0].start_datetime.to_i
    day = sec / 86400
    if sec < 3600 then
      time_format = "%M分%S秒"
      @test_time = (Time.parse("1/1") + (sec - day * 86400)).strftime(time_format)
    else
      # time_format = "#{day}日%H時間%M分%S秒"
      # @test_time = (Time.parse("1/1") + (sec - day * 86400)).strftime(time_format)
      @test_time = '１時間超え！？'
    end
  end
  
  def countRightAnswers(test2s)
    rightAnswerCount = 0
    for test2 in test2s do
      if test2.user_answer == test2.right_answer then
        rightAnswerCount = rightAnswerCount + 1
      end
    end
    return rightAnswerCount
  end
end
