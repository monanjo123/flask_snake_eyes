from flask import Flask
from snakeeyes.blueprints.page import page


def create_app():
    """
        Create Flask App using 'app' factory pattern
        :return: Flask App
    """

    app = Flask(__name__, instance_relative_config = True)
    
    app.config.from_object('config.settings')
    app.config.from_pyfile('settings.py', silent=True)

    app.register_blueprints(page)

    return app