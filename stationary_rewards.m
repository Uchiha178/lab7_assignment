epsilon = 0.1;  
n_actions = 2;  
q_values = zeros(1, n_actions);  
action_counts = zeros(1, n_actions); 

n_steps = 10000;  

for step = 1:n_steps
    if rand < epsilon
        action = randi(n_actions);  
    else
        [~, action] = max(q_values);  
    end
    
    if rand < 0.5
        reward = binaryBanditA(action);  
    else
        reward = binaryBanditB(action);  
    end
    
    action_counts(action) = action_counts(action) + 1;
    
    n = action_counts(action);
    q_values(action) = q_values(action) + (1/n) * (reward - q_values(action));
end

disp([Q-value for Action 1: ', num2str(q_values(1))])
disp(['Q-value for Action 2: ', num2str(q_values(2))])
