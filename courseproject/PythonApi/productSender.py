from flask import Flask, request
from flask import jsonify
import random
import json

app = Flask(__name__)

DEFAULT_COLORS = "Space Gray, Silver, PRODUCT(red)"
COLORS_12 = "Space Gray, Silver, PRODUCT(red), Blue"
IPAD_COLORS = "Silver, Gold, Space Gray"

products = {
    "mac": {
        0: {
            "id": 0,
            "title": 'MacBook Pro 15 2018',
            "price": 85000,
            "image": "macpro15.jpeg",
            "specs": {
                "cpu": "Intel Core i7, 6 core, 2.7Ghz",
                "gpu": "AMD Radeon Pro 560x",
                "ram": "2 x 16 GB",
                "screen": "XDR Pro Motion Retina Display"
            },
            "other": {
                "color": "silver",
                "touchID": True
            }
        },
        1: {
            "id": 1,
            "title": 'MacBook Pro 13 2020',
            "price": 88027,
            "image": "macpro13.jpeg",
            "specs": {
                "cpu": "Intel Core i5, 4 core, 2.3Ghz",
                "gpu": "AMD Radeon 550",
                "ram": "2 x 8 GB",
                "screen": "Retina Display"
            },
            "other": {
                "color": "silver",
                "touchID": True
            }
        },
        2: {
            "id": 2,
            "title": 'MacBook Pro 16 2021',
            "price": 192699,
            "image": "macpro16.jpeg",
            "specs": {
                "cpu": "Apple M1, 8 core, 3.3Ghz",
                "gpu": "AMD Radeon Vega 16",
                "ram": "2 x 32 GB",
                "screen": "XDR Pro Motion Retina Display"
            },
            "other": {
                "color": "silver",
                "touchID": True
            }
        },
        3: {
            "id": 3,
            "title": 'MacBook Pro 16 2022',
            "price": 229999,
            "image": "macpro16.jpeg",
            "specs": {
                "cpu": "Apple M2, 8 core, 3.8Ghz",
                "gpu": "AMD Radeon Vega 16",
                "ram": "2 x 32 GB",
                "screen": "XDR Pro Motion Retina Display"
            },
            "other": {
                "color": "silver",
                "touchID": True
            }
        },

        3: {
            "id": 3,
            "title": 'MacBook Pro 16 2022',
            "price": 249999,
            "image": "macpro16.jpeg",
            "specs": {
                "cpu": "Apple M2 Pro, 12 core, 3.8Ghz",
                "gpu": "AMD Radeon Vega 16",
                "ram": "2 x 32 GB",
                "screen": "XDR Pro Motion Retina Display"
            },
            "other": {
                "color": "silver",
                "touchID": True
            }
        },

        4: {
            "id": 4,
            "title": 'MacBook Pro 16 2022',
            "price": 264999,
            "image": "macpro16.jpeg",
            "specs": {
                "cpu": "Apple M2 Max, 16 core, 3.8Ghz",
                "gpu": "AMD Radeon Vega 16",
                "ram": "2 x 64 GB",
                "screen": "XDR Pro Motion Retina Display"
            },
            "other": {
                "color": "silver",
                "touchID": True
            }
        },
    
        5: {
            "id": 5,
            "title": 'MacBook Pro 14 2021',
            "price": 179990,
            "image": "macpro14.jpeg",
            "specs": {
                "cpu": "Apple M1 Pro, 16 core, 3.8Ghz",
                "gpu": "AMD Radeon Vega 16",
                "ram": "2 x 16 GB",
                "screen": "XDR Pro Motion Retina Display"
            },
            "other": {
                "color": "silver",
                "touchID": True
            }
        },
        6: {
            "id": 6,
            "title": 'MacBook Pro 14 2021',
            "price": 159990,
            "image": "macpro14.jpeg",
            "specs": {
                "cpu": "Apple M1, 16 core, 3.8Ghz",
                "gpu": "AMD Radeon Vega 16",
                "ram": "2 x 16 GB",
                "screen": "XDR Pro Motion Retina Display"
            },
            "other": {
                "color": "silver",
                "touchID": True
            }
        },

        7: {
            "id": 7,
            "title": 'MacBook Pro 14 2021',
            "price": 184990,
            "image": "macpro14.jpeg",
            "specs": {
                "cpu": "Apple M1 Pro, 16 core, 3.8Ghz",
                "gpu": "AMD Radeon Vega 16",
                "ram": "2 x 32 GB",
                "screen": "XDR Pro Motion Retina Display"
            },
            "other": {
                "color": "silver",
                "touchID": True
            }
        },
        7: {
            "id": 7,
            "title": 'MacBook Pro 14 2021',
            "price": 192999,
            "image": "macpro14.jpeg",
            "specs": {
                "cpu": "Apple M1 Max, 16 core, 3.8Ghz",
                "gpu": "AMD Radeon Vega 16",
                "ram": "2 x 64 GB",
                "screen": "XDR Pro Motion Retina Display"
            },
            "other": {
                "color": "silver",
                "touchID": True
            }
        }
    
    },

    "iphone": {
        0: {
            "id": 0,
            "title": "iPhone SE",
            "price": 59990,
            "image": "iphonese2.jpeg",
            "specs": {
                "cpu": "A15 Bionic",
                "memory": "128, 256, 512 GB",
                "display": "TN",
                "screensize": "4.7 inch"
            },
            "other": {
                "colors": DEFAULT_COLORS,
                "securitytechnology": "Touch ID"
            }
        },
        1: {
            "id": 1,
            "title": "iPhone X",
            "price": 29990,
            "image": "iphonex",
            "specs": {
                "cpu": "A11 Bionic",
                "memory": "64, 128, 256 GB",
                "display": "TN",
                "screensize": "5.8 inch"
            },
            "other": {
                "colors": DEFAULT_COLORS,
                "securitytechnology": "Face ID"
            }
        },
        2: {
            "id": 2,
            "title": "iPhone XS",
            "price": 39990,
            "image": "iphonexs.png",
            "specs": {
                "cpu": "A12 Bionic",
                "memory": "64, 128, 256 GB",
                "display": "TN",
                "screensize": "5.8 inch"
            },
            "other": {
                "colors": DEFAULT_COLORS,
                "securitytechnology": "Face ID"
            }
        },
        3: {
            "id": 3,
            "title": "iPhone XS Max",
            "price": 44990,
            "image": "iphonexsmax.jpeg",
            "specs": {
                "cpu": "A12 Bionic",
                "memory": "64, 128, 256 GB",
                "display": "TN",
                "screensize": "6.1 inch"
            },
            "other": {
                "colors": DEFAULT_COLORS,
                "securitytechnology": "Face ID"
            }
        },
        4: {
            "id": 4,
            "title": "iPhone 11",
            "price": 55990,
            "image": "iphone11.jpeg",
            "specs": {
                "cpu": "A12 Bionic",
                "memory": "64, 128, 256 GB",
                "display": "TN",
                "screensize": "6.1 inch"
            },
            "other": {
                "colors": DEFAULT_COLORS,
                "securitytechnology": "Face ID"
            }
        },
        5: {
            "id": 5,
            "title": "iPhone 11 Pro",
            "price": 52990,
            "image": "iphone11pro.jpeg",
            "specs": {
                "cpu": "A13 Bionic",
                "memory": "64, 128, 256 GB",
                "display": "TN",
                "screensize": "5.8 inch"
            },
            "other": {
                "colors": DEFAULT_COLORS,
                "securitytechnology": "Face ID"
            }
        },
        6: {
            "id": 6,
            "title": "iPhone 11 Pro Max",
            "price": 54990,
            "image": "iphone11promax.jpegg",
            "specs": {
                "cpu": "A13 Bionic",
                "memory": "64, 128, 256 GB",
                "display": "TN",
                "screensize": "6.5 inch"
            },
            "other": {
                "colors": DEFAULT_COLORS,
                "securitytechnology": "Face ID"
            }
        },
        7: {
            "id": 7,
            "title": "iPhone 12",
            "price": 73990,
            "image": "iphone12.jpeg",
            "specs": {
                "cpu": "A13 Bionic",
                "memory": "64, 128, 256 GB",
                "display": "TN",
                "screensize": "6.5 inch"
            },
            "other": {
                "colors": COLORS_12,
                "securitytechnology": "Face ID"
            }
        },
        8: {
            "id": 8,
            "title": "iPhone 12 Pro",
            "price": 77990,
            "image": "iphone12pro.png",
            "specs": {
                "cpu": "A14 Bionic",
                "memory": "64, 128, 256 GB",
                "display": "TN",
                "screensize": "6.5 inch"
            },
            "other": {
                "colors": COLORS_12,
                "securitytechnology": "Face ID"
            }
        },
        9: {
            "id": 9,
            "title": "iPhone 12 Pro Max",
            "price": 107090,
            "image": "iphone12promax.jpeg",
            "specs": {
                "cpu": "A14 Bionic",
                "memory": "64, 128, 256 GB",
                "display": "TN",
                "screensize": "6.5 inch"
            },
            "other": {
                "colors": COLORS_12,
                "securitytechnology": "Face ID"
            }
        },
        10: {
            "id": 10,
            "title": "iPhone 12 Mini",
            "price": 58590,
            "image": "iphone12mini.jpeg",
            "specs": {
                "cpu": "A13 Bionic",
                "memory": "64, 128, 256 GB",
                "display": "TN",
                "screensize": "6.5 inch"
            },
            "other": {
                "colors": COLORS_12,
                "securitytechnology": "Face ID"
            }
        },
        11: {
            "id": 11,
            "title": "iPhone 13.jpeg",
            "price": 79990,
            "image": "iphone13",
            "specs": {
                "cpu": "A14 Bionic",
                "memory": "64, 128, 256 GB",
                "display": "TN",
                "screensize": "6.5 inch"
            },
            "other": {
                "colors": COLORS_12,
                "securitytechnology": "Face ID"
            }
        },
        12: {
            "id": 12,
            "title": "iPhone 13 Pro",
            "price": 129990,
            "image": "iphone13pro.jpeg",
            "specs": {
                "cpu": "A15 Bionic",
                "memory": "64, 128, 256 GB",
                "display": "TN",
                "screensize": "6.5 inch"
            },
            "other": {
                "colors": COLORS_12,
                "securitytechnology": "Face ID"
            }
        },
        12: {
            "id": 12,
            "title": "iPhone 13 Pro Max",
            "price": 135964,
            "image": "iphone13promax.jpeg",
            "specs": {
                "cpu": "A15 Bionic",
                "memory": "64, 128, 256 GB",
                "display": "TN",
                "screensize": "6.5 inch"
            },
            "other": {
                "colors": COLORS_12,
                "securitytechnology": "Face ID"
            }
        },
        13: {
            "id": 13,
            "title": "iPhone 13 Mini",
            "price": 75990,
            "image": "iphone13mini.jpeg",
            "specs": {
                "cpu": "A15 Bionic",
                "memory": "64, 128, 256 GB",
                "display": "TN",
                "screensize": "6.5 inch"
            },
            "other": {
                "colors": COLORS_12,
                "securitytechnology": "Face ID"
            }
        },
    },

    "ipad": {
        0: {
            "id": 0,
            "title": "iPad Pro 12,9",
            "price": 146800,
            "image": "ipad",
            "specs": {
                "cpu": "A9X",
                "memory": "64, 128, 256 GB",
                "display": "TN",
                "screensize": "6.5 inch"
            },
            "other": {
                "colors": COLORS_12,
                "securitytechnology": "Face ID"
            }
        },
    }

}


@app.route('/length')
def returnLength():
    cat = request.args.get("category")
    data = {
        "categoryLength": len(products[cat])
    }
    return jsonify(data)
    

@app.route('/products/returnall',)
def returnAll():
    return jsonify(products[f"{request.args.get('category')}"])

@app.route('/products')
def getCategoryItems():
    id = int(request.args.get("id"))
    return jsonify(products[f'{request.args.get("category")}'][id])



if __name__ == '__main__':
    app.run(debug=True)
