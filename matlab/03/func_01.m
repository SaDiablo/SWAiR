function obraz_lab = func_01(obraz)
rows = size(obraz,1);
cols = size(obraz,2);
visited = false(rows, cols);
index = 1;
obraz_lab = zeros(rows, cols);
for i = 1 : 1 : rows
	for j = 1 : 1 : cols
		if obraz(i, j) == 0
			visited(i, j) = true;
			continue;
        elseif visited(i, j) == true
			continue;
		else
			stack = [i, j];
			while ~isempty(stack)
				loc = stack(1, :);
				stack(1, :) = [ ];
                if visited(loc(1), loc(2))
                    continue;
                end
				visited(loc(1), loc(2)) = true;
				obraz_lab(loc(1), loc(2)) = index;
				for m = loc(1)-1 : loc(1)+1
					for n = loc(2)-1 : loc(2)+1
						if m < 1 || m > rows || n < 1 || n > cols || obraz(m, n) == false || visited(m, n) == true
							continue;
						else
							stack = [stack ; [m, n]];
						end
					end
				end
			end
			index = index + 1;
		end
	end
end
end