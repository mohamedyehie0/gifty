import pandas as pd
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics.pairwise import linear_kernel
from flask import Flask, request,jsonify

app = Flask(__name__)



#from collections import defaultdict

#putting movies data on 'movies' dataframe
product = pd.read_csv('Amazon_Dataset.csv')

#print(product['Product Name'][0])

tfidf = TfidfVectorizer(stop_words='english')

product['About Product'] = product['About Product'].fillna('')

overview_matrix = tfidf.fit_transform(product['About Product'])

overview_matrix.shape

similarity_matrix = linear_kernel(overview_matrix,overview_matrix)
#print(similarity_matrix)
mapping ={}

    
for index, row in product.iterrows():
    mapping[index] = row.to_dict()
    #print(mapping)

mapping = list(mapping.values())
#res = list(mapping.values()).index('DB Longboards CoreFlex Crossbow 41" Bamboo Fiberglass Longboard Complete')
#mapping = pd.Series(product.index,index = product['Product Name'])
#print(mapping)
@app.route('/api',methods=['GET'])
def recommend_movies_based_on_plot():
    #movie_index = mapping[movie_input]
    movie_input = str(request.args['Query'])
    movie_index = next((index for (index, d) in enumerate(mapping) if d["Product Name"] == movie_input), None)

    #print(movie_index)
    #get similarity values with other movies
    #similarity_score is the list of index and similarity matrix
    similarity_score = list(enumerate(similarity_matrix[movie_index]))
    #sort in descending order the similarity score of movie inputted with all the other movies
    similarity_score = sorted(similarity_score, key=lambda x: x[1], reverse=True)
    # Get the scores of the 15 most similar movies. Ignore the first movie.
    similarity_score = similarity_score[0:3]
    #return movie names using the mapping series
    movie_indices = [i[0] for i in similarity_score]
    #print(movie_indices)

    newmapping = {}

    for i, element in enumerate(movie_indices):
        for index, dic in enumerate(mapping):
            if (element == index):
                newmapping[i] = dic
    #print(mapping)

    #newmapping = list(newmapping.values())

    return jsonify(newmapping[0]["Image"],)

if __name__ == '__main__':
    app.run()

#print(recommend_movies_based_on_plot('DB Longboards CoreFlex Crossbow 41" Bamboo Fiberglass Longboard Complete'))










