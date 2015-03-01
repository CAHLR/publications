function d = distance(M,col,p,l,g,s)
  index = 1;
  max_val = M(1,col);
  for i=1:size(M,1)
    if M(i,col) > max_val
	  max_val = M(i,col);
index = i;
    end
  end
    %disp(max_val);
    %disp(M(index,1:4));
    d = (M(index,1)-p)*(M(index,1)-p) + (M(index,2)-l)*(M(index,2)-l) + (M(index,3)-g)*(M(index,3)-g) + (M(index,4)-s)*(M(index,4)-s);
