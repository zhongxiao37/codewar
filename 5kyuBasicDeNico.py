import re
def de_nico(key,msg):
    step = len(key)
    key_index = [sorted(key).index(s) for s in key]
    msg_list = [list(msg[i:min(i+step, len(msg))]) for i in range(0, len(msg), step)]
    new_msg = [row[idx] for row in msg_list for idx in key_index if idx < len(row)]
    return re.sub(r'\s+$', '', ''.join(new_msg))



print(de_nico("crazy","cseerntiofarmit on"))