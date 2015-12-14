function [new_thickness] = thickness_smoothing(skin_info)

thick = skin_info(:,5);

mavg = 5;
new_thickness = zeros(size(thick));

for ii = 1+mavg:length(thick)-mavg
    if thick(ii) > mean(thick(ii-mavg:ii+mavg)) + std(thick(ii-mavg:ii+mavg));
        new_thickness(ii) = mean(thick(ii-mavg:ii+mavg)) ;
    else
        new_thickness(ii) = thick(ii);
    end
end

end