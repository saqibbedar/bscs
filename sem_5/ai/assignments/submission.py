
'''
    Assignment Distribution
    Student 1: Abdullah Usman (Problem 1a Feature extraction, Problem 1b Dividing the Dataset, Problem 3 Comparing Classifiers)
    Student 2: Muhammad Saqib ( Problem 3a Learn Predictor, 2b Evaluate Predictor)
    Studetn 3: Muhammad Ali Shah ( Problem 2c, 2d)
'''



import csv
import math 
############################################################
# Problem 1: binary classification
############################################################

############################################################
# Problem 1a: feature extraction

def extractWordFeatures(filelocation):

    sentences = []
    labels = []
    features = []

    with open(filelocation, 'r') as file:
        reader = csv.reader(file) # csv.reader is built-in python function that parses a file and treats each row as list
        next(reader)  # Skiping the first row (which contains the metadata )
        for row in reader:
            sentences.append(row[1]) 
            labels.append(row[2])

    # now that i have sentences i am begining with feature extraction
    for sentence in sentences:
        word_frequency = {} # a dictionary that will store the word as key and its frequency as value

        words = sentence.split() # convering each senetence into list of words


        for word in words:
            word_frequency[word] = word_frequency.get(word, 0) + 1

        features.append(word_frequency)
    return features, labels

############################################################
# Problem 1b: divide the dataset into training and test sets 

def split (features, labels): # add required parameters

    total_data_size = len(features)

    # we need to split the data keep 80% for training and 20% for testing 
    seperate_index = int(0.8 * total_data_size) # this is the index upto the 80% of the entire features

    training_features = features[:seperate_index] # staring from 0 to seperate_index(upto 80%)
    training_labels = labels[:seperate_index] # starting from 0 to seperate_index(upto 80%) 

    testing_features = features[seperate_index:] # starting from seperate_index (form 80%) to end (100%)  containing total of 20 %
    testing_labels = labels[seperate_index:] # starting from seperate_index(form 80%) to end (100%) containing total of 20 %

    return training_features, training_labels, testing_features, testing_labels


features, labels = extractWordFeatures('dataset.csv')

############################################################
# Problem 1c: Predictor using stochastic gradient descent and hinge loss

def learnPredictor(trainExamples, numIters, eta):

    weights = {}  # dictionary to store weight for each word

    for t in range(numIters):  # run for given iterations (epochs)
        for feats, y in trainExamples:
            # convert label '0' to -1 if necessary
            y = int(y)
            if y == 0:
                y = -1

            # compute margin = y * (w · x)
            margin = y * sum(weights.get(f, 0.0) * v for f, v in feats.items())

            # if margin < 1 -> hinge loss active; update weights
            if margin < 1:
                for f, v in feats.items():
                    weights[f] = weights.get(f, 0.0) + eta * y * v
    return weights


############################################################
# Problem 1d: evaluate predictor 

def evaluate(testExamples, weights):  # add required parameters
    '''
    Evaluate the learned weights on test examples
    Return the accuracy (percentage of correctly classified examples)
    '''

    # BEGIN_YOUR_CODE
    correct = 0
    total = len(testExamples)

    for feats, y in testExamples:
        y = int(y)
        if y == 0:
            y = -1

        # prediction = sign(w · x)
        prediction = 1 if sum(weights.get(f, 0.0) * v for f, v in feats.items()) >= 0 else -1

        if prediction == y:
            correct += 1

    accuracy = correct / total
    # END_YOUR_CODE

    return accuracy


############################################################
# Problem 2: nearest neighbor classification
############################################################

############################################################
# Problem 2c: find the distance of each test tuple from each training example 
# and return minimum distance training for each test tuple
############################################################

def finddistance(testExample, trainExamples):
    '''
    Compute the distance between test example and all training examples.
    Return the (minimum distance, corresponding training label)
    '''

    # BEGIN_YOUR_CODE
    min_distance = float('inf')
    nearest_label = None

    for feats, label in trainExamples:
        # use Euclidean distance between word-frequency vectors
        # combine keys from both feature dicts
        all_keys = set(feats.keys()) | set(testExample.keys())
        distance = 0.0
        for key in all_keys:
            distance += (feats.get(key, 0) - testExample.get(key, 0)) ** 2
        distance = math.sqrt(distance)

        if distance < min_distance:
            min_distance = distance
            nearest_label = label
    # END_YOUR_CODE

    return min_distance, nearest_label



############################################################
# Problem 2d: Classify test tuple (as per closest training example)
############################################################

def classify(testExamples, trainExamples):
    '''
    Classify each test example using nearest neighbor method.
    Return accuracy on test set.
    '''

    # BEGIN_YOUR_CODE
    correct = 0
    total = len(testExamples)

    for feats, label in testExamples:
        _, predicted_label = finddistance(feats, trainExamples)

        if int(label) == int(predicted_label):
            correct += 1

    accuracy = correct / total
    # END_YOUR_CODE

    return accuracy


############################################################
# Problem 3: compare classifiers
############################################################

def compare(training_features, training_labels, testing_features, testing_labels):
    '''
    The function should compare the result of each test tuple for both classifiers 
    and give percentage of correctly classified test tuples by both classifiers.
    '''

    # converting the training data into a way that be used by learnPredictor
    trainExamples = []
    for x, y in zip(training_features, training_labels): # zip function is combining the elements from multiple lists    
        y_val = int(y)
        if y_val == 0:  # converting all the 0s into -1 because of hinge loss 
            y_val = -1
        trainExamples.append((x, y_val))

    # now doing the same as above for testing features and labels
    testExamples = []
    for x, y in zip(testing_features, testing_labels):
        y_val = int(y)
        if y_val == 0:
            y_val = -1
        testExamples.append((x, y_val))

    # running the binary classifier to extract weights
    weights = learnPredictor(trainExamples, numIters=10, eta=0.01)

    # evaluating the binary classifier
    binary_accuracy = evaluate(testExamples, weights)

    # now paring data again for nearest neightbour classifier
    trainPairs = list(zip(training_features, training_labels))
    testPairs = list(zip(testing_features, testing_labels))

    # evaluating nearest neighbour classifier
    n_neighbour_accuracy = classify(testPairs, trainPairs)

    # --- Print and compare ---
    print(f"Binary Classifier Accuracy: {binary_accuracy*100:.2f}%")
    print(f"Nearest Neighbour Accuracy: {n_neighbour_accuracy*100:.2f}%")




#  Extract features and labels from dataset file
features, labels = extractWordFeatures('dataset.csv')
print(f"Extracted {len(features)} examples from dataset.")

#  Split into 80% training, 20% testing
training_features, training_labels, testing_features, testing_labels = split(features, labels)
print(f"Training set: {len(training_features)} examples, Test set: {len(testing_features)} examples")

# Comparing classifiers (binary vs nearest neighbor)
compare(training_features, training_labels, testing_features, testing_labels)

