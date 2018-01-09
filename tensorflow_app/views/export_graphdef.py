import os
import random
import string

from datetime import datetime
from django.views.decorators.csrf import csrf_exempt
from django.http import JsonResponse
from keras.models import Model
from keras.models import model_from_json
import tensorflow as tf
from keras import backend as K
from keras_app.views.export_json import export_json_util

BASE_DIR = os.path.dirname(
    os.path.dirname(
        os.path.dirname(
            os.path.abspath(__file__))))


def randomword(length):
    return ''.join(random.choice(string.lowercase) for i in range(length))


def json2pbtxt(json_string, f, output_fld):
    net_model = model_from_json(json_string)
    sess = K.get_session()
    tf.train.write_graph(sess.graph.as_graph_def(),
                         output_fld, f + '.pbtxt', as_text=True)
    print('saved the graph definition at: ', os.path.join(output_fld, f))


@csrf_exempt
def export_to_tensorflow(request):
    json_string = export_json_util(request)
    randomId = datetime.now().strftime('%Y%m%d%H%M%S') + randomword(5)
    json2pbtxt(json_string, randomId, BASE_DIR + '/media/')
    return JsonResponse({'result': 'success',
                         'id': randomId,
                         'name': randomId + '.pbtxt',
                         'url': '/media/' + randomId + '.pbtxt'})
