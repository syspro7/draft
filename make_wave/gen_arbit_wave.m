function [wave] = gen_arbit_wave(source)

plot(source.Time, source.Data);
hold on;
x = [source.Time(1) source.Time(end)];
y = [min(source.Data) max(source.Data)];
%title(source.Name);

set (gcf, 'WindowButtonMotionFcn', @mouseMove);

function mouseMove (object, eventdata)
C = get (gca, 'CurrentPoint');
title(gca, ['(X,Y) = (', num2str(C(1,1)), ', ',num2str(C(1,2)), ')']);
plot(gca, C(1,1), C(1,2), '*');
xlim(x);
ylim(y);
end

end