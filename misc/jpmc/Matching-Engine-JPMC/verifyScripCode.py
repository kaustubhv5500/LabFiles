from bsedata.bse import BSE
b=BSE()

def index(req):
    postData = req.form
    code = str(postData['param'].value)
    b.updateScripCodes()
    result=b.verifyScripCode(code)
    # print(result)
    return result