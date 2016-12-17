function [fval] = calibrate_obj(L)
L = [L(1); 0.135; 0.160; L(2); L(3)];


P0T_zero = [0.215; 0; 0];

q_data = [45 45 45 0;
          30 30 30 0;
          20 30 40 0;
          10 10 10 0;
          50 20 10 0;
          -45 20 35 0;
          -40 40 40 0;
          -20 30 20 0;
          -70 0 30 0;
          -70 20 20 0];
      
      
P0T_data = [-0.03, 0.184 0.015;
            0.01 0.131 0.073;
            0.015 0.081 0.05;
            0.017 0.041 0.014;
            0.168 0.2 0.135;
            -0.05 -0.165 0.07;
            -0.012 -0.17 0.037;
            0.042 -0.093 0.98;
            -0.015 -0.182 0.091;
            -0.129 -0.235 0.109];
        
        
        
sz = size(P0T_data);
fval = 0;
for i = 1:sz(1)
    [ ~, P0T_calc ] = forward_kinematics_calibrate( q_data(i,:), L );
    f = P0T_calc - (P0T_data(i,:).' + P0T_zero);
    fval = fval + norm(f)^2;
    
end

end