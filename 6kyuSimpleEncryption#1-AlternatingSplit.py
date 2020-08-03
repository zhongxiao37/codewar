def decrypt(encrypted_text, n):
    if n <= 0:
        return encrypted_text
    encrypted_text = list(encrypted_text)
    decrypted_list = [None for _ in encrypted_text]
    counter = 0
    while True:
        for i in range(1, len(encrypted_text), 2):
            decrypted_list[i] = encrypted_text[i // 2]
        for i in range(0, len(encrypted_text), 2):
            decrypted_list[i] = encrypted_text[len(encrypted_text) // 2 + i // 2]
        
        counter += 1
        if counter >= n:
            break
        encrypted_text = decrypted_list
        decrypted_list = [None for _ in encrypted_text]

    return ''.join(decrypted_list)


def encrypt(text, n):
    if n <= 0:
        return text
    text = list(text)
    encrypted_list = []
    counter = 0
    while True:
        for i in range(1, len(text), 2):
            encrypted_list.append(text[i])
        for i in range(0, len(text), 2):
            encrypted_list.append(text[i])
        
        counter += 1
        if counter >= n:
            break
        text = encrypted_list
        encrypted_list = []

    return ''.join(encrypted_list)

# print(encrypt("This is a test!", 1))
print(decrypt("s eT ashi tist!", 2))
