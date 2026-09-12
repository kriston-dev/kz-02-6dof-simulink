%created by Kriston Rickman
%Date created: 09/12/26
%v1.00
%Notes:
%keyboard W pitch nose down

%S pitch nose up

% A roll left
% 
% D roll right
% 
% E yaw right
% 
% r throttle up
% 
% F throttle down
% 
% space center the control surfaces

classdef user_key_inputs < matlab.System

    %Variables that only belong to user_key_input thus, those variables
    %underneath will follow this object
    properties
        
        %We search up an engine that fits our aircraft and find the
        %throttle rate, we can also use exisitng aircraft as a good
        %reference
        throttle_rate = 0.5; %assumption
        init_thorottle = 0;
        user_control_block_update = 0.01; %assumption
        % /*We need to come back and view the data by changing the update, 
        % and when it barely changse that will be the update value*\

    end

    properties(Access = private)

        W = false;
        S = flase;
        A = false;
        D = false;
        Q = false;
        E = false;
        R = fase;
        F = false
        space = false;
        throttle = 0;
        capture_key_cntrl = [];
    end

    methods(Access = protected)

        function setupImpl(input)

            input.throttle = input.init_throttle;

            input.capture_key_cntrl = figure( "name", "manual_control", ...
                "KeyPressFcn", @(~, event)obj.keyDown(event), ...
                "KeyReleaseFcn", @(~, event)input.keyUp(event));
        end

        % function throttle roll, pitch, and yaw inputs = stepImpl 
        % 
        % roll = double(input.D) - double(input.A)
        % 
        % pitch = doub input S - doub input.W
        % 
        % yaw = doubl input E = doub input.Q

        % if input.R
        %     intput.throttle = input.throttle .* input.update_rate
        % 
        % end
        % 
        % if input.F
        %     input.thorttle = input.thortltle - input.throttle_rate .* ...
        %         input.update_rate
        % 
        % end

        % input.thorttle = %from 0 to 1
        % % We need to keep thorttle between the limits just like our 2DOF
        % 
        % user_throttle = input.throttle;
    end

    % function release Impl(input)
    %     if isgraphics(input.user_cntrl_hold)
    % 
    %         delete(input.user_cntrl_hold);

    % end

    % function refresh_time = getting_refresh_time(input)
    % 
    %     refresh_time = createSampleTime(input, 'Type', 'Discrete', ...
    %         'refresh_time', input.refresh_time);
    % 
    % end

    methods(Access = private)

        function key_press(input,event)

            switch event.key

                case "w"
                    input.W = true;

                case "s"
                    input.S = true;

                case "a"
                    input.A = true;

                case "d"
                    input.D = true;

                case "q"
                    input.Q = true;

                case "e"
                    input.E = true;

                case "r"
                    input.R = true;

                case "f"
                    input.F = true;

            end

        end

        function key_release(input,event)

            switch event.key

                case "w"

                    input.W = false;

                case "s"

                    input.S = false;

                case "a"

                    input.A = false;

                case "d"

                    input.D = false;

                case "q"

                    input.Q = false;

                case "e"

                    input.E = false;

                case "r"

                    input.R = false;

                case "f"

                    input.F = false;

            end

        end

    end

    methods(Static, Access = protected)
    
    function simMode = getSimulateUsingImpl
    
    simMode = "Interpreted execution";
    
    end
    
    end
end