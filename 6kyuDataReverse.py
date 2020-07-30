def data_reverse(data):
    new_data = []
    for i in range((len(data) / 8) - 1, -1, -1):
        new_data += data[i*8:i*8+8] 
    return new_data


data1 = [1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,0,1,0,1,0,1,0]
print(data_reverse(data1))