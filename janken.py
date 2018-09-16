#!/usr/bin/env python
# coding: utf-8

from bottle import route, run, template, request
from bottle import error, HTTPResponse, static_file
import random


@error(404)
def error_404(error):
    r = HTTPResponse(status=302)
    r.set_header('Location', '/')
    return r


@route('/static/:file_path')
def static(file_path):
    return static_file(file_path, root='./static')


@route('/')
@route('/', method='POST')
def janken():
    req = request.params.__dict__['dict']
    counter = {
        'draw': int(request.forms.get('draw')) if ('draw' in req) else 0,
        'lost': int(request.forms.get('lost')) if ('lost' in req) else 0,
        'won': int(request.forms.get('won')) if ('won' in req) else 0,
    }
    hand = {
        'mine': -1,
        'his': int(request.forms.get('his')) if ('his' in req) else -1,
    }
    result = -1

    if (hand['his'] != -1
            and 0 <= int(hand['his']) <= 2):
        hand['his'] = int(hand['his'])
        hand['mine'] = random.randint(0, 2)
        result = (hand['his'] - hand['mine'] + 3) % 3
        if result in [0]:
            counter['draw'] += 1
        elif result in [1]:
            counter['lost'] += 1
        elif result in [2]:
            counter['won'] += 1

    return template('janken', counter=counter, hand=hand, result=result)


run(host='0.0.0.0', port=8000, debug=True, reloader=True)
