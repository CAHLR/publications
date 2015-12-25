import csv, sys, math
import numpy as np

# usage: python <input_dir> <output_file>
# e.g.:  python ../out/params/real5/ distance_real5.csv

metrics = ['LL','RMSE','AUC','Prec','Recall','Auc']
n = len(metrics)

def distance_print(x):
  for row in x:
    print '\t'.join([str(i) for i in row])

def run(filename):
  print filename
  f = open(filename,'r')
  params = []
  distance = np.zeros((n,n))
  try:
    reader = csv.reader(f,delimiter=',')
    for i in range(n):
      params.append([float(x) for x in reader.next()])
      
  finally:
    f.close()
  
  #print params
  for i in range(n):
    for j in range(n):
      sum = 0
      for k in range(4):
        sum = sum + (params[i][k] - params[j][k])**2
      sum = math.sqrt(sum)
      distance[i][j] = sum
      distance[j][i] = sum
  distance_print(distance)
  return distance

def stat(ds, out):
  o = open(out,'w')
  m = len(ds)
  print >>o, "metric,metric,min,max,median,mean,std"
  for i in range(n):
    for j in range(n):
      if i < j: #not(i == j):
        vals = []
        for k in range(m):
          vals.append(ds[k][i][j])
        #print metrics[i], metrics[j], min(vals), max(vals), np.median(vals), np.mean(vals), np.std(vals)
        print >>o, "%s,%s,%f,%f,%f,%f,%f" % (metrics[i], metrics[j], min(vals), max(vals), np.median(vals), np.mean(vals), np.std(vals))
  o.close()

dir = sys.argv[1]

# real datasets
datasets = ['assistments_adding_sub_fractions_params.csv' ,'assistments_area_circle_params.csv', 'assistments_exponents_params.csv', 'cogtutor_fractions_calc_lcd_params.csv','cogtutor_area_circle_params.csv','cogtutor_exponents_2_params.csv', 'khan_adding_sub_fractions_params.csv','khan_area_circle_params.csv','khan_exponents_2_params.csv']

# simulated datasets
# datasets = [str(x) + '_params.csv' for x in range(1,27)]

ds = []
for data in datasets:
  ds.append(run(dir + data))

stat(ds,sys.argv[2])
