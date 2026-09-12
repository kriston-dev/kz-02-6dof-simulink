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
        init_throttle = 0;
        user_control_block_update = 0.01; %assumption
        % /*We need to come back and view the data by changing the update, 
        % and when it barely changse that will be the update value*\

    end

    properties(Access = private)

        W = false;
        S = false;
        A = false;
        D = false;
        Q = false;
        E = false;
        R = false;
        F = false;
        space = false;
        throttle = 0;
        capture_key_cntrl = [];
    end

    methods(Access = protected)

        function setupImpl(input)

            input.throttle = input.init_throttle;

            input.capture_key_cntrl = figure( "name", "manual_control", ...
                "KeyPressFcn", @(~, event)input.key_press(event), ...
                "KeyReleaseFcn", @(~, event)input.key_release(event));
        end

        function [user_throttle, user_roll, user_pitch, user_yaw] = stepImpl(input) 

        user_roll = double(input.D) - double(input.A);

        user_pitch = double(input.S) - double(input.W);

        user_yaw = double(input.E) - double(input.Q);

        if input.space

            user_roll = 0;
            user_pitch = 0;
            user_yaw = 0;

        end

        if input.R

            input.throttle = input.throttle + input.throttle_rate .* ...
                input.user_control_block_update;

        end

        if input.F

            input.throttle = input.throttle - input.throttle_rate .* ...
                input.user_control_block_update;

        end

        input.throttle = min(max(input.throttle,0),1);
        %from 0 to 1. We need to keep throttle
        % between the limits just like our 2DOF

        user_throttle = input.throttle;

        end

    function releaseImpl(input)

        if isgraphics(input.capture_key_cntrl)

            delete(input.capture_key_cntrl);

        end

    end

    function sts = getSampleTimeImpl(input)

        sts = createSampleTime(input, 'Type', 'Discrete', ...
            'SampleTime', input.user_control_block_update);

    end
end

    methods(Access = private)

        function key_press(input,event)

            switch event.Key

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

                case "space"

                    input.space = true;

            end

        end

        function key_release(input,event)

            switch event.Key

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

                case "space"
                    input.space = false;

            end

        end

    end

    methods(Static, Access = protected)
        
        function simMode = getSimulateUsingImpl
        
            simMode = "Interpreted execution";
    
        end
    
    end
end