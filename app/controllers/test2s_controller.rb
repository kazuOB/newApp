class Test2sController < ApplicationController
  
  require 'date'
  
  def index
    
    # ユーザーが回答することで埋まっていく）
    # TODO 回答状況によって出題を変更する
    # TestMasterからtestを作成する
    test_num = Test2.maximum(:test_num).to_i + 1
    word_num = 0
    @test2 = createTestByTestMaster(test_num, word_num)
    
    # 開始時刻を記録する
    @test2.start_datetime = DateTime.now
    
    # テストをDBに保存する
    @test2.save
  end
  
  def create
    @test2s = Test2.all
  end
  
  def show
    # 問題番号を取得する
    # TODO ブラウザバックで2個前の問題に戻ってしまう。
    @test2 = Test2.find_by(id: params[:id])
    logger.debug(@test2.inspect)
  end
  
  def update
    # 問題番号を取得する
    @test2 = Test2.find_by(id: params[:id])
    # 回答をsaveする
    
    @test2.user_answer = params[:test2][:user_answer]
    
    @test2.end_datetime = DateTime.now
    @test2.save
    
    # 次の問題のIDを設定する
    word_num = @test2.word_num.to_i + 1
    test_num = @test2.test_num.to_i
    # IDが最大出題数を超えていたら結果ページに遷移する
    if word_num.to_i > 9 then
      redirect_to :controller => 'results', :action => 'index', :test_num => @test2.test_num
    # IDが最大出題数を超えていなければ次の問題を変数に格納する
    else      
      # TestMasterからtestを作成する
      @test2 = createTestByTestMaster(test_num.to_i, word_num.to_i)
      # 開始時刻を記録する
      @test2.start_datetime = DateTime.now
      # テストをDBに保存する
      @test2.save
    end
  end
  def createTestByTestMaster(test_num, word_num)
    # （仮）問題を取得する（この時点ではすべてのカラムが埋められていない
    # ユーザーが回答することで埋まっていく）
    test2 = Test2.new
    
    # 最初の問題を変数に格納する
    randomNumber = rand(0..2801)
    test_master = TestMaster.find(randomNumber)
    
    # testを作成する
    test2.word = test_master.word
    test2.answer1 = test_master.answer1
    test2.answer2 = test_master.answer2
    test2.answer3 = test_master.answer3
    test2.answer4 = test_master.answer4

    test2.right_answer = test_master.right_answer
    test2.test_num = test_num.to_i
    test2.word_num = word_num.to_i
    
    return test2
  end
end
