function [precision,recall,acc] = precision_recall(actual,predicted)
  tp = 0;
tn = 0;
fp = 0;
fn = 0;

for s=1:size(actual,1)
  for r=1:size(actual,2)
    if actual(s,r) == 1
      if round(predicted(s,r)) == 1
	tp=tp+1;
      else
        fn=fn+1;
      end
    else
      if round(predicted(s,r)) == 1
	fp=fp+1;
      else
        tn=tn+1;
      end
    end	  
  end
end

precision=double(tp)/double(tp+fp);
recall=double(tp)/double(tp+fn);
acc=double(tp+tn)/double(tp+fp+tn+fn);
