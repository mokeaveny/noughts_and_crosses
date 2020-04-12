class Game
	def initialize
		@board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
		@player1 = Player.new
		@player2 = Player.new
		@current_player = @player1
		@current_player_name = "Player 1"
		@won = false
    @tie = false 
		@winner = ""
	end

	def choose_position
		valid_move = false
		while valid_move == false
		puts "#{@current_player_name} Choose a position on the board to place your nought or cross: "
		pos = gets.chomp.to_i # Inputs the position they want to select
			if @board[pos] == " " # If the position is empty then they are able to assign their symbol to the board
				@board[pos] = @current_player.symbol
				valid_move = true
			else
				puts "That isn't a valid position choice! Try again!"
			end
		end
	end
	
	def swap_player
		if @current_player == @player1
			@current_player = @player2
			@current_player_name = "Player 2"
		else
			@current_player = @player1
			@current_player_name = "Player 1"
		end
	end
	
	def check_win
		if @board[0..2].all? { |symb| symb == @current_player.symbol } # Horizontal 1 check
			@won = true

		elsif @board[3..5].all? { |symb| symb == @current_player.symbol } # Horizontal 2 check
			@won = true

		elsif @board[6..8].all? { |symb| symb == @current_player.symbol } # Horizontal 3 check
			@won = true

		elsif @board[0] == @current_player.symbol && @board[3] == @current_player.symbol && @board[6] == @current_player.symbol # Vertical 1 check
			@won = true
		
		elsif @board[1] == @current_player.symbol && @board[4] == @current_player.symbol && @board[7] == @current_player.symbol # Vertical 2 check
			@won = true
		
		elsif @board[2] == @current_player.symbol && @board[5] == @current_player.symbol && @board[8] == @current_player.symbol # Vertical 3 check
			@won = true
		
		elsif @board[0] == @current_player.symbol && @board[4] == @current_player.symbol && @board[8] == @current_player.symbol # Diagonal 1 check
			@won = true
		
		elsif @board[2] == @current_player.symbol && @board[4] == @current_player.symbol && @board[6] == @current_player.symbol # Diagonal 2 check
			@won = true
		
		elsif @board.all? { |symb| symb != " "} # Checks if it's a draw. Ends the game.
			@tie = true

		end
	end

 	def display
		puts "-----------"
		puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
		puts "-----------"
		puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
		puts "-----------"
		puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
		puts "-----------"
	end

	def play
		while @won == false && @tie == false # Game loop, loops until the game finishes by a player winning or a player tieing.
			display
			choose_position
			check_win
			swap_player
		end
		swap_player # To display the correct winner we need to do one last player swap
		display
		puts "Game Ended"
		if @won == true
			puts "#{@current_player_name} Won!"
		else
			puts "It was a tie!"
		end
	end	
end


# Player class creates a player object and assigns an object to that player.
class Player
	attr_accessor :symbol, :name
	@@no_of_players = 0
	def initialize
		@@no_of_players += 1
		if (@@no_of_players % 2) == 1
			@symbol = "O"
		else
			@symbol = "X"
		end
	end
end

new_game = Game.new
new_game.play