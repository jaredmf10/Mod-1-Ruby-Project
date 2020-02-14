require_relative '../config/environment'
$prompt = TTY::Prompt.new

def find_players_for_team(team_name)
    found_team = Team.find_by(name: team_name)
        found_team.players.each do |player|
            puts "#{player.name}, Position: #{player.position}, Rating: #{player.rating}" 
        end
end

def find_team_id(team_name)
    current_team = Team.find_by(name: team_name)
    current_team.id
end

def find_player_and_add(add_choice, team_name)
    player_added = Player.find_by(name: add_choice)
    player_added.update(team_id: find_team_id(team_name))
end

def return_to_main(team_name)
    main_team = Team.find_by(name: team_name)
    system("clear")
    main_menu(main_team.id)
end

def show_free_agents
    Team.last.players.each do |player|
        puts "#{player.name}, Position: #{player.position}, Rating: #{player.rating}"
    end
end

def find_player_and_delete(to_drop)
    dropped = Player.find_by(name: to_drop)
    dropped.destroy
end

def create_player(team_name)
    new_name = $prompt.ask("What is the player's full name?")
    new_position = $prompt.ask('FWD, D, or G')
    new_rating = $prompt.ask("How good is this player on a scale from 1-100?")
    new_id = find_team_id(team_name)
    player = Player.create(name: new_name, position: new_position, rating: new_rating, team_id: new_id)
end

###########################################################################################

def buy_a_team
    puts "Welcome to the Metropolitan Division!"
    puts "So you want to buy a team and you think you can run it too?"
    puts "Which team would you like to purchase?"
    puts '1. Carolina Hurricanes - $450,000,000'
    puts '2. Columbus Blue Jackets - $325,000,000'
    puts '3. New Jersey Devils - $550,000,000'
    puts '4. New York Islanders - $520,000,000'
    puts '5. New York Rangers - $1,650,000,000'
    puts '6. Philadelphia Flyers - $825,000,000'
    puts '7. Pittsburgh Penguins - $665,000,000'
    puts '8. Washington Capitals - $775,000,000'
    input = gets.chomp.to_i
    main_menu(input)
end

def main_menu(input)
    system("clear")
    case (input)
    when 1
        team_name = "Carolina Hurricanes"
        puts 'Hurricanes GM Options'.black.on_red
    when 2
        team_name = "Columbus Blue Jackets"
        puts 'Blue Jackets GM Options'
    when 3
        team_name = "New Jersey Devils"
        puts 'Devils GM Options'
    when 4
        team_name = "New York Islanders"
        puts 'Islanders GM Options'
    when 5
        team_name = "New York Rangers"
        puts 'Rangers GM Options'
    when 6
        team_name = "Philadelphia Flyers"
        puts 'Flyers GM Options'
    when 7
        team_name = "Pittsburgh Penguins"
        puts 'Penguins GM Options'
    when 8
        team_name = "Washington Capitals"
        puts 'Capitals GM Options'
    end
    puts '1. View Roster'
    puts '2. Add Free Agent'
    puts '3. Buy Out for Retirement'
    puts '4. Create Player'
    puts '5. Quit'
    team_name
    choice = gets.chomp.to_i
    gm_action(choice, team_name)
end

def gm_action(choice, team_name)
    system("clear")
    case (choice)
    when 1
        puts "Roster"
        find_players_for_team(team_name)
        gets.chomp
    when 2
        puts "Available Free Agents"
        puts "Please enter the FULL NAME of Plyer you wish to Add to your Roster"
        show_free_agents
        add_choice = gets.chomp
        find_player_and_add(add_choice, team_name)
    when 3
        puts "Select Player from Roster to Buy Out for Retirement"
        find_players_for_team(team_name)
        puts ""
        puts "Please enter the FULL NAME of Plyer you wish to Buy Out"
        to_drop = gets.chomp
        find_player_and_delete(to_drop)
    when 4
        puts "Create Player"
        create_player(team_name)
    when 5
        begin
            exit
        end
    end
    return_to_main(team_name)
end
