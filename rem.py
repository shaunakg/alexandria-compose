import time

import requests

idx = 1570
url = "https://alexandria.srg.id.au/ajax/delete/"

payload={}
headers = {
  'authority': 'alexandria.srg.id.au',
  'accept': '*/*',
  'accept-language': 'en-AU,en-GB;q=0.9,en-US;q=0.8,en;q=0.7',
  'cache-control': 'no-cache',
  'content-length': '0',
  'cookie': 'remember_token=3|c2959194e38856515e711aadb12f28a94c776a3541ea5ac9e9c1963856b85e9cf8f306fea364b23c161ce91d68e12cf9af35096daa23c4b075882c1c7fbfdd0b; session=.eJwljsFqAzEMBf_F5x5sSc_y5mcW2ZJIKLSwm5xK_z1bepyBgfkpex5x3svtebzio-wPL7cy3JiyMdVBKlB1U8ZymCq6GRmH50CbIOu2dKMAPLFq6vTNt84yUElSxiYhEF1T1NCE0CpP06xoaCN7dNbqM-KqverUweUaeZ1x_N_84TqP3J_fn_F1iZU2JzhW54D31ICyVCZCEi-s2bPX9PL7BoLdPu4.YlzIGA.p5fSJMycxrW1rlN1Qdz0YFt_kpo',
  'dnt': '1',
  'origin': 'https://alexandria.srg.id.au',
  'pragma': 'no-cache',
  'referer': 'https://alexandria.srg.id.au/table?data=list&sort_param=stored',
  'sec-ch-ua': '" Not A;Brand";v="99", "Chromium";v="100", "Google Chrome";v="100"',
  'sec-ch-ua-mobile': '?0',
  'sec-ch-ua-platform': '"macOS"',
  'sec-fetch-dest': 'empty',
  'sec-fetch-mode': 'cors',
  'sec-fetch-site': 'same-origin',
  'user-agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36',
  'x-csrftoken': 'ImNmYWJiNTNlYzYzZTVkNmY3ZTU3MzQwMzIyNWYyM2M1Y2I2ZjYwZmQi.YlzIGA.ecUGjROxQziWvN5YoECttDEC_RI',
  'x-requested-with': 'XMLHttpRequest'
}

while True:
    # input("ENTER to delete " + str(idx) + "?")
    # time.sleep(0.5)
    print(f"Deleting {idx}")
    response = requests.request("POST", url + str(idx), headers=headers, data=payload)
    print(response.json()) # [1]["type"], response.json()[1]["message"]
    idx -= 1

    if idx == 451:
        exit()
