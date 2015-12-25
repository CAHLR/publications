import csv, sys

# usage: python <input_file> <output_file>

dir = sys.argv[1]
outdir = sys.argv[2]

def convert(filename, delim, user_i, correct_i, true_convert ,length):
    print filename
    f = open(dir + filename,'r')
    o = open(outdir + filename,'w')
    try:
        reader = csv.reader(f,delimiter=delim)
        header = reader.next()
        print header[user_i], ",",  header[correct_i]
        print "Number of responses =", length

        students = {}

        # sample = reader.next()
        # print sample[user_i], ",",  sample[correct_i]
        for row in reader:
            student = row[user_i]
            correct = row[correct_i]
            if true_convert:
                if correct == "true":
                    correct = "1"
                elif correct == "false":
                    correct = "0"
                else:
                    correct = "-"
            if student in students:
                students[student].append(correct)
            else:
                students[student] = [correct]

        filtered = 0
        for id in students:
            responses = students[id]
            if len(responses) >= length:
                print >>o, ','.join(students[id][:length])
                filtered = filtered + 1

        print "Number of students = %d  (total %d)" % (filtered, len(students))
                
    finally:
        f.close()
        o.close()
    print ""

assist_params = (',',2,6,False,8)
cogtutor_params = ('\t',1,13,False,8)
khan_params = (',',0,1,True,8)

assist_datasets = ['assistments_adding_sub_fractions.csv','assistments_area_circle.csv', 'assistments_exponents.csv']
cogtutor_datasets = ['cogtutor_fractions_calc_lcd.csv','cogtutor_area_circle.csv','cogtutor_exponents_2.csv']
khan_datasets = ['khan_adding_sub_fractions.csv','khan_area_circle.csv','khan_exponents_2.csv']

params = [assist_params, cogtutor_params, khan_params]
datasets = [assist_datasets, cogtutor_datasets, khan_datasets]


for i in range(3):
    param = params[i]
    dataset_list =  datasets[i]
    for data in dataset_list:
        convert(data ,*param)
    print "-------------------------------------"
