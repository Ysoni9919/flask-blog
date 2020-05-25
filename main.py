from flask import Flask, render_template, request,session,redirect  #this is import a flask app and rquest module and render templates
from flask_sqlalchemy import SQLAlchemy  #this is a sqlalchemy to connect a database 
from werkzeug.utils import secure_filename
from datetime import datetime  
import json   #this is json file to open file
import math
from flask_mail import Mail  #this is use to send mail funtionsaliy

import os
with open('C:\\Users\\akash\\Desktop\\python3.8\\python-flask\\config.json','r') as c:
    params=json.load(c)["params"]
    
local_server=True
app = Flask(__name__)
app.secret_key='super-secret-key'

app.config['UPLOAD_FOLDER']=params['upload_location']
app.config.update(
    MAIL_SERVER='smtp.gmail.com',
    MAIL_PORT='465',
    MAIL_USE_SSL=True,                             #this is coonnect a gmail using a smtp
    MAIL_USERNAME=params['gmail-user'],
    MAIL_PASSWORD=params['gmail-password']

)
mail=Mail(app)
if(local_server):
    app.config['SQLALCHEMY_DATABASE_URI'] =params['local_uri']
    
else:
    app.config['SQLALCHEMY_DATABASE_URI'] =params['prod_uri']


db = SQLAlchemy(app)   #this is connect database app


class Contact(db.Model):#this is Contact and data value pass entry Contact is same
    '''
    sno, name phone_num, msg, date, email      #this is class to connect a database table of contact
    '''
    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), nullable=False)
    phonenum = db.Column(db.String(12), nullable=False)
    msg = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12), nullable=True)
    email = db.Column(db.String(20), nullable=False)

class Posts(db.Model):#this is posts in database and data value pass entry Contact is same
    '''
    sno,title,slug,content,date  #this is class to connect a database table for posts
    '''
    sno = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80), nullable=False)
    tagline = db.Column(db.String(120), nullable=False)
    slug = db.Column(db.String(21), nullable=False)
    content = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12), nullable=True)
    img_file = db.Column(db.String(12), nullable=True)
    

@app.route("/")      #this is index belong to google show ip and /
def home():
    posts=Posts.query.filter_by().all()
    last=math.ceil(len(posts)/int(params['no_of_posts']))

    # posts=Posts.query.filter_by().all()[0:params['no_of_posts']] #kitne page lena chata nu
    page=request.args.get('page')
    if(not str(page).isnumeric()):
        page=1
    page=int(page)
    posts=posts[(page-1)*int(params['no_of_posts']):(page-1)*int(params['no_of_posts'])+int(params['no_of_posts'])]
    # pagination logic
    #first page
    # prev=#
    # next=page+1
    if (page==1):
        prev="#"
        next="/?page="+str(page+1)
    elif(page==last):
        next="#"
        prev="/?page="+str(page-1)

    else:
        next="/?page="+str(page+1)
        prev="/?page="+str(page-1)


    return render_template('index.html',params=params,posts=posts,next=next,prev=prev)
    
    # middle page
    # prev=page-1
    # next=page+1
    
    
    # last page
    # prev=page-1
    # next=#
    
    



@app.route("/dashboard",methods=['GET','POST'])      #this is index belong to google show ip and /
def dashboard():
    if ('user' in session and session['user']== params['admin_username']):
        posts=Posts.query.all()    
        return render_template('dashboard.html',params=params,posts=posts)

    if request.method=='POST':
        username=request.form.get('username')
        userpassword=request.form.get('password')
        if (username == params['admin_username'] and userpassword == params['admin_password'] ):
            # set a session varible 
            session['user']=username
            posts=Posts.query.all()    
            return render_template('dashboard.html',params=params,posts=posts)


    
    return render_template('login.html',params=params)


@app.route("/edit/<string:sno>",methods=['GET','POST']) 
def edit(sno):
    if ('user' in session and session['user']== params['admin_username']):
        if request.method=='POST':
            box_title=request.form.get('title')
            tline=request.form.get('tagline')
            slug=request.form.get('slug')
            content=request.form.get('content')
            img=request.form.get('img_file')
            date=datetime.now()

            if sno=='0':
                post=Posts(title=box_title,tagline=tline,slug=slug,content=content,img_file=img,date=date)
                db.session.add(post)
                db.session.commit()

            else:
                post=Posts.query.filter_by(sno=sno).first()
                post.title=box_title,
                tagline=tline,
                slug=slug,
                content=content,
                img_file=img,
                date=date
                db.session.commit()
                return redirect('/edit/'+sno)
                
        


        post=Posts.query.filter_by(sno=sno).first()
        # return render_template('editdashboard.html',params=params,sno=sno)
        return render_template('editdashboard.html',params=params,post=post)
            
@app.route("/uploader", methods = ['GET', 'POST'])
def upload():
    if(request.method=='POST'):
        f=request.files['file1']
        f.save(os.path.join(app.config['UPLOAD_FOLDER'],secure_filename(f.filename)))
        return "upload successfully"







@app.route("/about")
def about():
    return render_template('about.html',params=params)   #this params come to config.jon file

@app.route("/post/<string:post_slug>",methods=['GET'])
def post_route(post_slug):
    post=Posts.query.filter_by(slug=post_slug).first()    #thi si post is come in database in class posts


    return render_template('post.html',params=params,post=post)


@app.route("/contact", methods = ['GET', 'POST'])
def contact():
    if(request.method=='POST'):
        '''Add entry to the database'''
        name = request.form.get('name')
        email = request.form.get('email')
        phone = request.form.get('phone')
        message = request.form.get('message')
        #this is entry a database first word is big
        entry = Contact(name=name, phonenum = phone, msg = message, date= datetime.now(),email = email )
        db.session.add(entry)
        db.session.commit()
        mail.send_message('New message From'+ name,sender=email,recipients=[params['gmail-user']],
        body=message+"\n"+phone)        #this is send to mail funtion
    
    return render_template('contact.html',params=params)

@app.route("/logout")
def logout():
    session.pop('user')
    return redirect('/dashboard')


@app.route("/delete/<string:sno>", methods = ['GET', 'POST'])
def delet(sno):

    if ('user' in session and session['user']== params['admin_username']):
        # post=Post.query.filter_by(sno=sno).first()
        post=Posts.query.filter_by(sno=sno).first()
        db.session.delete(post)
        db.session.commit()
    return redirect('/dashboard')


app.run(debug=True)

