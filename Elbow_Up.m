
function [theta1,theta2]=Elbow_UP(L1,L2,x,y)
% Inverse Kinematics calculations
% Compute cos(theta2) using the law of cosines
D = (x^2 + y^2 - L1^2 - L2^2) / (2 * L1 * L2);

% Check if the position is reachable
if abs(D) > 1
    error('Target position is out of reach');
end

% Compute theta2 for the elbow-up configuration (negative sqrt)
theta2 = atan2(-sqrt(1 - D^2), D);

% Compute theta1 using the elbow-up configuration
theta1 = atan2(y, x) - atan2(L2 * sin(theta2), L1 + L2 * cos(theta2));

fprintf('Theta1 (deg): %.2f\n', theta1);
fprintf('Theta2 (deg): %.2f\n', theta2);

% % Convert the angles to degrees for better interpretation
% theta1_deg = rad2deg(theta1);
% theta2_deg = rad2deg(theta2);
% 
% % Display the joint angles
% fprintf('Theta1 (deg): %.2f\n', theta1_deg);
% fprintf('Theta2 (deg): %.2f\n', theta2_deg);

% Visualization (optional)
% figure;
% hold on;
% plot([0, L1*cos(theta1)], [0, L1*sin(theta1)], 'b-', 'LineWidth', 2); % First link
% plot([L1*cos(theta1), x], [L1*sin(theta1), y], 'r-', 'LineWidth', 2); % Second link
% scatter([0, L1*cos(theta1), x], [0, L1*sin(theta1), y], 'ko'); % Joints
% axis equal;
% xlabel('X');
% ylabel('Y');
% title('2R Robotic Arm - Elbow Up');
% grid on;
