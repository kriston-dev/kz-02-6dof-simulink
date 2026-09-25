%Created by Kriston Rickman
%Date created: 09/11/2026
%v1_05
%KZ-02 6DOF simulation
%Notes:

%/*I am currently laying down the fundamentals of how I want my
%program to go and will place a rough draft of all the equations I will be
%using. Additionally I will write down all the calc 3 concepts I believe
%can be integrated in this project.*\

%If statements check if there is a user saved file, and if not it will
%create one.

clear %-except 
clc

% if isfile("user_saved_file")
% 
%     load("user_saved_file.mat", "user_saved_file");
% 
% else
% 
%     user_saved_file = struct('name', {}, 'user_input', {});
% 
% end



%This starts the state machine
currState = States.MAIN_MENU;

% Initializes the state machine loop
while true
    switch currState

        case States.MAIN_MENU

            currState = main_menu();

            %This will be where the user will first be placed showing them
            %options to either open the menu to input their data or to go
            %access their saved aircraft data

        case States.USER_AIRCRAFT_OPT

            % currState = user_aircraft_opt(user_saved_file)
            
            %When the user saves aircraft data, and they want to acces it.
            %they choose user aircraft data from the main menu and enter
            %into this case

        case States.USER_SAVED_AIRCRAFT_MENU

            % currState = user_saved_aircraft_menu()

            %This will show options of that specific file that was selected
            %from USER_AIRCRAFT_OPT such as EDIT or display inputs.

        case States.EDIT_USER_AIRCRAFT_DATA

            % user_saved_file = edit_user_airacraft_data(user_saved_file);

            %The user will be given an option to choose a number that edits
            %a specific value, and will save the data and then enter them
            %back into the same edit funciton. There will be an option to
            %exit.

        case States.DISP_USER_AIRCRAFT_DATA

            % disp_user_aircraft_data(user_saved_file)

            %This will hold a function of displaying the data

        case States.INPUT_MENU

            % Code to handle input menu such as aerodynamics, goemetries,
            % and initial info such as position and etc
            [currState, user_input] = input_menu();

            % user_saved_file = creating_file(user_saved_file, user_input);
            
        case States.MANUAL_CONTROL_SIM

            manual_control_sim(user_input);

            currState = States.USER_SAVED_AIRCRAFT_MENU;

            %Will hold the code for user control through keyboard
        
        case States.AUTOPILOT_SIM

            %Will hold the code for autopilot and will be given a set of
            %directions to showcase Calc 3 concepts

    end
end



% functions will be HERE



%Main menu functions HERE



function currState = main_menu()

currState = States.INPUT_MENU;
%For now we will skip the saved aircraft data until we given users the
%ability to be able to input their data

end



%The user airacraft names HERE



%function currState = user_aircraft_opt(user_saved_file)

% disp("0  - Back to last page");
% disp("1  - " + user_saved_file(1).name);

%user_choice = input("Your choice: ");

% switch user_choice
    % case 0
        % currState = States.MAIN_MENU;

    % case 1
        % currState = States.USER_SAVED_AIRCRAFT_MENU;
        
% end
%end



% choices of saved file HERE

% function currState = user_saved_aircraft_menu()
% disp("0  - Back to last page");
% disp("1  - edit saved data");
% disp("2  - display saved data");
% disp("3  - start simulation: manual control");
% disp("4  - start simulation: autopilot");
% 
% user_choice = input();
% 
% switch user_choice

%     case 0

%         currState = States.USER_AIRCRAFT_OPT;
% 
%     case 1

%         currState = States.EDIT_USER_AIRCRAFT_DATA;
% 
%     case 2

%         currState = DISP_USER_AIRCRAFT_DATA;
% 
%     case 3

%         currState = States.MANUAL_CONTROL_SIM;
% 
%     case 4
% 
%         currState = States.AUTOPILOT_SIM;
% 
% end
% end



%Edit the saved data from file HERE



% function [currState, user_saved_file] = edit_user_airacraft_data(user_saved_file)
% 
% disp("0  - Back to last page");
% 
% user_choice = input("Your choice: ");
% 
% switch user_choice
% 
%     case 0
% 
%         currState = States.USER_SAVED_AIRCRAFT_MENU;
% 
% end
% 
% saving_data(user_saved_file);
% 
% end


%Display the saved data from file HERE



% function disp_user_aircraft_data(user_saved_file)
% 
% disp(user_saved_file.user_input);
% 
% 
% 
% end



%Input menu functions HERE 



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


%energy based ocnstrinat analysis inputs
user_input.Engine_power_HP = 230;

user_input.Span = 9;

user_input.Sweep_angle = 3;

user_input.Mass_without_wing_skin = 780;

user_input.Wing_material_density = 2700;

user_input.Wing_skin_thickness = 0.0020;

user_input.C_Dmin = 0.0270;

user_input.C_Lmin = 0.3000;

user_input.C_Lmax_TO = 1.7000;

user_input.S_G = 502.9200;

user_input.K_TO = 1.2000;

user_input.Rolling_friction_coefficient = 0.0300;

user_input.Propeller_efficiency_TO = 0.7500;

user_input.altitude_TO = 0;

user_input.Fuel_spent_ground_to_TO = 1;

user_input.Fuel_mass_per_gallon = 2.7200;

user_input.rate_of_climb = 3.9700;

user_input.velocity_climb = 96;

user_input.altitude_climb = 0;

user_input.velocity_cruise = 155;

user_input.altitude_cruise = 5000;

user_input.radius_turn = 300;

user_input.altitude_turn = 1000;

user_input.C_Lmax_turn = 1.3800;

user_input.K_turn = 1.3000;

user_input.velocity_accel = 120;

user_input.accel_horiz = 0.6000;

user_input.altitude_horiz_accel = 2438;

user_input.velocity_approach = 78;

user_input.K_approach = 1.3000;

user_input.C_Lmax_approach = 1.7900;

user_input.altitude_approach = 0;


% Stability and Empennage Conceptual Design Inputs
user_input.Wing_area = 8.2000;

user_input.Horizontal_tail_volume_coeff = 0.7000;

user_input.Vertical_tail_volume_coeff = 0.0400;

user_input.Cockpit_radius = 0.6500;

user_input.Fuselage_radius_near_tail = 0.2300;

user_input.AR_HS = 4;

user_input.AR_VS = 1.6000;

user_input.TR = 0.4500;

user_input.tail_efficiency = 0.9000;

user_input.X_wing_root_LE = 2.6000;

user_input.thrust = 1580.7148;


% Trim, Load, and CG Inputs
user_input.Propeller_mass = 12;

user_input.X_propeller = 0.2500;

user_input.Engine_mass = 145;

user_input.X_engine = 0.8500;

user_input.Fuselage_mass = 182;

user_input.X_fuselage = 3.8159;

user_input.Wing_mass = 44.2800;

user_input.X_wing = 3;

user_input.HS_mass = 12;

user_input.X_HS = 4.9656;

user_input.VS_mass = 9;

user_input.X_VS = 4.9500;

user_input.Landing_nose_gear_mass = 12;

user_input.X_nose_landing_gear = 1.2500;

user_input.Landing_main_gear_mass = 25;

user_input.X_main_landing_gear = 3.0500;

user_input.Avionics_mass = 18;

user_input.X_avionics = 2.1000;

user_input.Battery_mass = 10;

user_input.X_battery = 5.5000;

user_input.Fuel_mass = 90;

user_input.X_fuel = 3.1000;

user_input.Pilot_mass = 80;

user_input.X_pilot = 2.9000;

user_input.Front_passenger_mass = 80;

user_input.X_front_passenger = 2.9000;

user_input.Rear_passenger_mass = 80;

user_input.X_rear_passenger = 3.6500;

user_input.Baggage_mass = 25;

user_input.X_baggage = 4.4500;

massArray = [user_input.Propeller_mass, user_input.Engine_mass, ...
    user_input.Fuselage_mass, user_input.Wing_mass, user_input.HS_mass, ...
    user_input.VS_mass, user_input.Landing_nose_gear_mass, ...
    user_input.Landing_main_gear_mass, user_input.Avionics_mass, ...
    user_input.Battery_mass, user_input.Fuel_mass, user_input.Pilot_mass, ...
    user_input.Front_passenger_mass, user_input.Rear_passenger_mass, ...
    user_input.Baggage_mass];

%The total mass
user_input.total_mass = user_input.Propeller_mass + user_input.Engine_mass + ...
    user_input.Fuselage_mass + user_input.Wing_mass + user_input.HS_mass + ...
    user_input.VS_mass + user_input.Landing_nose_gear_mass + ...
    user_input.Landing_main_gear_mass + user_input.Avionics_mass + ...
    user_input.Battery_mass + user_input.Fuel_mass + user_input.Pilot_mass + ...
    user_input.Front_passenger_mass + user_input.Rear_passenger_mass + ...
    user_input.Baggage_mass;


user_input.min_static_margin = 0.1000;

user_input.C_M_AC_TO = -0.0509;

user_input.tail_incidence = 0;

user_input.wing_incidence = 2;

user_input.max_elevator_up = 25;

user_input.elevator_efficiency = 0.5000;

user_input.alpha_L0_wing = -1.8797;

user_input.AoA_L0_HS = 0;

user_input.C_L_AoA_TO = 0.0981;

user_input.C_M_AoA_TO = -0.0122;

user_input.downwash_TO = 6.0750;

user_input.C_M0 = 0.0169;

user_input.C_M_delta_e = -0.0321;

user_input.limit_load_factor = 3.8000;

user_input.gust_velocity = 15.2400;

user_input.gust_alt = 5000;

user_input.velocity_aircraft_gust = 155;

user_input.touchdown_sink_rate = 3.0500;

user_input.gear_effective_stroke = 0.1800;


%6DOF variable for wind
user_input.Xe_wind_velocity = 0;

user_input.Ye_wind_velocity = 0;

user_input.Ze_wind_velocity = 0;



%DATCOM outputs from DATCOM v1_01

    % arrays
user_input.AoA_array = [-4 -2 0 2 4 6 8 10 12 14 16];

user_input.elevator_deflection_array = [-10 -5 0 5 10];

user_input.delta_C_L_elevator_array = [-0.064 -0.032 0 0.032 0.064];

user_input.delta_C_m_elevator_array = [0.1368 0.0690 -0.0001 -0.0690 -0.1380];

user_input.C_L_AoA_array = [-0.183 0.020 0.227 0.439 0.656 0.878 1.102 1.295 1.459 1.590 1.646];

user_input.C_D_AoA_array = [0.026 0.024 0.026 0.031 0.040 0.052 0.068 0.084 0.101 0.117 0.126];

    %In radians
user_input.C_L_delta_e = 0.3667;

user_input.C_m_delta_e = -0.7907;

%We converted this from deg to Radians
user_input.C_m_AoA_derivative = -0.8067;

user_input.C_L0 = 0.227;




    %The pitch rate as a derivative
%Also just converted these both to radians
user_input.C_L_q = 8.7548;

user_input.C_m_q = -187.5291;



% Aircraft position in Earth frame coordinates
user_input.Xe_initial = 0;

user_input.Ye_initial = 0;

user_input.Ze_initial = 0;

% Body axis velocity HERE
user_input.init_u = 0;

user_input.init_v = 0;

user_input.init_w = 0;

% Euler attitude angles HERE
user_input.init_phi = 0;

user_input.init_theta = 0;

user_input.init_psi = 0;

% Body axis angular rates HERE
user_input.init_p = 0;

user_input.init_q = 0;

user_input.init_r = 0;

%Actuator Dimensions
user_input.elevator_span = 0.3;

user_input.elevator_chord = 0.2632;

user_input.HS_span = 1.4659;

user_input.HS_chord = 0.1466;


%Here I will give users option to choose manual or autopilot control
currState = States.MANUAL_CONTROL_SIM;

%/*HERE I will give an option to save the
% aircraft data once I asked for the user inputs with a function*\

end

    %This will be used after user enter their data

    %This will create the file for the user to save their data HERE

% function user_saved_file = creating_file(user_saved_file, user_input)
% 
% disp("1  - yes");
% disp("2  - no");
% 
% user_choice = input("Save your inputs?: ");
% 
% switch user_choice
% 
%     case 1
% 
%     new_aircraft.name = input("Aircraft name: ");
% 
%     new_aircraft.user_input = user_input;
% 
%     user_saved_file(end + 1) = new_aircraft;
% 
%     save("user_saved_file.mat", "user_saved_file");
% 
%     disp("Your aircraft data has been saved");
% 
%     case 2
% 
%         disp("did not save aircraft data");
% 
%     otherwise
% 
%         disp("input was not yes or no");
% 
%         user_saved_file = creating_file(user_saved_file, user_input);
% 
% end
% end



% The Manual control simulation will be HERE



function manual_control_sim(user_input)

%user controls idea is to control the actuators and contrl surfaces:

%This will place the data that simulink can easily access
assignin("base", "user_input", user_input);

control_mode = 1;

assignin("base", "control_mode", control_mode);


%General process of going from user inputs to aircrafts coordinates:

%1. user inputs for the forces and moments to get lift, drag, pitching moment

% user inputs for the inertia matrix based on the mass and its coordinates 
% and goemetry of aircraft

%2. pitching moment to rotational dynamics with inertia matrix and initial body rate
%which outputs body rate that goes to translational dynamics and rotational
%kinematics.

%3. total mass, lift, drag, body rate, inital velocity, attitudes (from
%rotational kinematics) to get the velocity in body axis

%4. To get rotational kinematics we need the inital attitude and the body rate
%to get the final attitudes

%5. To get the aircraft position relative to earth frames we use translational
%kinematics which uses an initial position of the aircraft in earth
%coordinates, the velocity of the aircraft, the attitudes
% 
% 6. The use of earths radius in meters to convert earth coordinates to LLA
% (latitude/longitude/altitude).

%Opens the model and then -
open_system("SIM_6DOF");

% - runs the model
% sim("SIM_6DOF");

end



%General formulas used around the program HERE



%Saving aircraft data HERE



% function saving_data(user_saved_file)
% 
% user_saved_file(1).user_input = user_saved_file;
% 
% save("user_saved_file.mat", "user_saved_file");
% 
% disp("Data has been saved...");
% 
% end