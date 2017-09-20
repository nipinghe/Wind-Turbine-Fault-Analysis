function devIVs = i_vector(PF,tvDim)

% load('UBMt7.mat');                        % Loading saved UBM model once trained

%% Initializing the necessary parameters

[classes,num_samples] = size(PF);         % size of our data cell structure
stats = cell(classes,num_samples);        % statistics required for I-Vector model
devIVs = zeros(tvDim, classes, num_samples);

%% Training Universal Background Model (UBM) [comment this section once trained]

nmix = 256;                             % In this case, we know the # of mixtures needed
final_niter = 50;                       % Number of iterations required
ds_factor = 1;                          % Down-Sampling Factor
nWorkers = 2;                           % Number of parallel pool workers (usually equal to CPU cores)
ubm = gmm_em(PF(:), nmix, final_niter, ds_factor, nWorkers);   % train UBM model                                   

%% Mapping the available data to the UBM space

for s = 1:classes
    for c = 1:num_samples
        [N,F] = compute_bw_stats(PF{s,c}, ubm);
        stats{s,c} = [N; F];
    end
end

%% Finding Total variability in the data [comment this section once trained]
           
niter = 5;                                                 
T = train_tv_space(stats(:), ubm, tvDim, niter, nWorkers);   % TV matrix

%% Extracting I-Vectors from the data

for s = 1:classes
    for c = 1:num_samples
        devIVs(:, s, c) = extract_ivector(stats{s, c}, ubm, T);
    end
end

%% Saving data

save devIVs1 devIVs;
save UBMsvm ubm T;
end