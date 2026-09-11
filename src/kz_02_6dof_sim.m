%Created by Kriston Rickman
%Date created: 09/11/2026
%v1_00
%KZ-02 6DOF simulation
%Notes:
%/*I am currently laying down the fundamentals of how I want my
%program to go and will place a rough draft of all the equations I will be
%using. Additionally I will write down all the calc 3 concepts I believe
%can be integrated in this project.*\


%This starts the state machine
currState = States.MAIN_MENU;

% Initializes the state machine loop
while true
    switch currState

        case MAIN_MENU

            %This will be where the user will first be placed showing them
            %options to either open the menu to input their data or to go
            %access their saved aircraft data

        case States.SAVED_AIRCRAFT_DATA
            
            %When the user saves aircraft data, and they want to acces it.
            %they choose user aircraft data from the main menu and enter
            %into this case

        case States.EDIT_SAVED_AIRCRAFT_DATA

            %The user will be given an option to choose a number that edits
            %a specific value, and will save the data and then enter them
            %back into the same edit funciton. There will be an option to
            %exit.

        case States.INPUT_MENU

            [currState, user_input] = input_menu();

            disp(user_input.ref_wing_area);

            % Code to handle input menu such as aerodynamics, goemetries,
            % and initial info such as position and etc
            
        case States.MANUAL_CONTROL_SIM

            %Will hold the code for user control through keyboard
        
        case States.AUTOPILOT_SIM

            %Will hold the code for autopilot and will be given a set of
            %directions to showcase Calc 3 concepts

    end
end



function [currState, user_input] = input_menu()

%/*This funciton will ask the user or pull up a gui system (if possible in
% the coding workespace) for theu ser to input their geometry, aerodynamics,
% and what is needed for the aircraft. However, during development, these
% variables will be fixed to run through the program quicker and to test my
% specific design (the KZ-02 from the development branch of my conceptual 
% aircraft design app repository) if the aircraft can bank and complete 
% objectives.*\

%/*I will more likely use different inputs into the app due to the first 
% inputs being examples and assumptions in the beginning and later on used
% with DATCOM.*\

%After the user can place their inputs, I will create a user saved file so 
%users do not need to input 

user_input.ref_wing_area = 8.2;

currState = MANUAL_CONTROL_SIM;

%/*HERE I will give an option to save the
% aircraft data once I asked for the user inputs*\

end



