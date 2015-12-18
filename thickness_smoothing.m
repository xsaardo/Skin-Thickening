function [new_thickness] = thickness_smoothing(thickness)
% Remove anomalous outlier thickness values 

mavg = 5;
new_thickness = thickness;

for ii = 1+mavg:length(thickness)-mavg
    if thickness(ii) > mean(thickness(ii-mavg:ii+mavg))
        new_thickness(ii) = mean(thickness(ii-mavg:ii-1));
    else
        new_thickness(ii) = thickness(ii);
    end
end

end