from scipy.stats.stats import pearsonr

real5 = [0.206508,0.755744,0.964146,0.841406,0.673950,0.761555,0.869801,0.860127,0.574664,0.738429,0.870432,0.789085,0.839831,0.597657,0.439071]
sim = [0.004387,0.492472,0.676332,0.654071,0.479938,0.491538,0.675496,0.654208,0.481353,0.705440,0.784577,0.564255,0.793279,0.556668,0.490985]

print pearsonr(real5,sim)

