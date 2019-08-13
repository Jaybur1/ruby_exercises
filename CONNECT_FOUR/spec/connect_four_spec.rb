require 'spec_helper'

describe Board do
  let(:board) {Board.new}
  
  describe "#new" do
    it "creates a new instance of board" do
      expect(board).to be_an_instance_of(Board)
    end
  end

  describe "#create" do 
    it "creates a new data hash of the new board" do 
      expect(board.data).to be_kind_of(Hash)
    end
  end
  describe '#create' do
    it "creates rows with column sized arrays, symbolize the board" do
      board.create
      expect(board.data[:row_1]).to be_an_instance_of(Array)
    end    
  end

  describe "#display" do
    it "displays a string that shows the board acording to the data" do
      board.create
      expect(board.display).to be_an_instance_of(String)
    end
  end

  describe "#update" do 
    it "updates the hash by 2 arguments (player , column)" do
      board.create

      board.update("O", 3)
      board.update("O", 3)
    #when empty it should drop the disk to the last row (bottom)
      expect(board.data[:row_6][2]).to eql("O")
      expect(board.data[:row_6][3]).to be_nil
      expect(board.data[:row_5][2]).to eql("O")
    end
  end



  describe '#check_diagonal_and_vertical' do
    it "checks if there is a diagonal win" do
      board.create
      ve_di_win_fill(board)
      expect(board.check_diagonal_and_vertical("O")).to eql(true)
      expect(board.check_diagonal_and_vertical("X")).to eql(true)
    end
    
  end

  describe "#check_winner" do
    it "checks if there is a winner in the current turn given a current player" do
      board.create
      #row_win_check(board)
      ve_di_win_fill(board)
      expect(board.check_winner("O")).to eql(true)
      expect(board.check_winner("X")).to eql(true) #true for vertical test, false for horizontal test
    end
  end

end

describe Player do
  let(:player) {Player.new("O","John")}

  describe "#new" do
    it "creates a new player instance" do
      expect(player).to be_an_instance_of(Player)
    end
  end

describe Game do
  let(:game) {Game.new}

  describe '#new' do
    it "creates a new game sequensce from the Game class" do
      expect(game).to be_an_instance_of(Game)
    end
  end

  describe '#make_turn' do
    it "initialize and comleating a turn of one of the players" do 
      board = Board.new
      board.create
      game.make_turn("X", 4, board)
      expect(board.data["row_6".to_sym][3]).to eql("X")
      expect(board.check_winner("X")).to eql(false)
    end
  end
end
  
end

