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
    end

    properties(Access = private, Transient)
        capture_key_cntrl = [];
    end

    methods(Access = protected)

        function setupImpl(obj)
            obj.throttle = obj.init_throttle;

            obj.capture_key_cntrl = figure("Name", "manual_control", "NumberTitle", "off");
            obj.capture_key_cntrl.WindowKeyPressFcn = @(~,event)obj.key_press(event);
            obj.capture_key_cntrl.WindowKeyReleaseFcn = @(~,event)obj.key_release(event);
        end

        function [user_throttle, user_roll, user_pitch, user_yaw] = stepImpl(obj) 

        user_roll = double(obj.D) - double(obj.A);

        user_pitch = double(obj.S) - double(obj.W);

        user_yaw = double(obj.E) - double(obj.Q);

        if obj.space

            user_roll = 0;
            user_pitch = 0;
            user_yaw = 0;

        end

        if obj.R

            obj.throttle = obj.throttle + obj.throttle_rate .* ...
                obj.user_control_block_update;

        end

        if obj.F

            obj.throttle = obj.throttle - obj.throttle_rate .* ...
                obj.user_control_block_update;

        end

        obj.throttle = min(max(obj.throttle,0),1);
        %from 0 to 1. We need to keep throttle
        % between the limits just like our 2DOF

        user_throttle = obj.throttle;

        end

    function releaseImpl(obj)

        if isgraphics(obj.capture_key_cntrl)

            delete(obj.capture_key_cntrl);

        end

    end

    function sts = getSampleTimeImpl(obj)

        sts = createSampleTime(obj, 'Type', 'Discrete', ...
            'SampleTime', obj.user_control_block_update);

    end

    function [sz1,sz2,sz3,sz4] = getOutputSizeImpl(~)

        sz1 = [1 1];
        sz2 = [1 1];
        sz3 = [1 1];
        sz4 = [1 1];

    end

    function [dt1,dt2,dt3,dt4] = getOutputDataTypeImpl(~)

        dt1 = "double";
        dt2 = "double";
        dt3 = "double";
        dt4 = "double";

    end

    function [fs1,fs2,fs3,fs4] = isOutputFixedSizeImpl(~)

        fs1 = true;
        fs2 = true;
        fs3 = true;
        fs4 = true;
    
    end

    function [c1,c2,c3,c4] = isOutputComplexImpl(~)

        c1 = false;
        c2 = false;
        c3 = false;
        c4 = false;
    
    end

end

    methods(Access = private)

        function key_press(obj,event)
            disp("KEY PRESSED: " + event.Key)

            switch event.Key

                case "w"
                  
                    obj.W = true;

                case "s"
                  
                    obj.S = true;

                case "a"
                  
                    obj.A = true;

                case "d"
                   
                    obj.D = true;

                case "q"
                   
                    obj.Q = true;

                case "e"
                  
                    obj.E = true;

                case "r"
                
                    obj.R = true;

                case "f"
            
                    obj.F = true;

                case "space"

                    obj.space = true;

            end

        end

        function key_release(obj,event)

            switch event.Key

                case "w"

                    obj.W = false;

                case "s"

                    obj.S = false;

                case "a"

                    obj.A = false;

                case "d"

                    obj.D = false;

                case "q"

                    obj.Q = false;

                case "e"

                    obj.E = false;

                case "r"

                    obj.R = false;

                case "f"

                    obj.F = false;

                case "space"
                    obj.space = false;

            end

        end

    end

    methods(Static, Access = protected)
        
        function simMode = getSimulateUsingImpl
        
            simMode = "Interpreted execution";
    
        end
    
    end
end