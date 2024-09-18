const express = require("express");
const app= express();
const mongoose=require("mongoose");
app.use(express.json());
//mongodaki benim database'im kurarsan kendi linkini koy
const mongoUrl="urladress";
const bcrypt= require("bcryptjs");
const jwt=require('jsonwebtoken');
const JWT_SECRET="token"

mongoose.connect(mongoUrl).then(()=>{
    console.log("database connected");
})
.catch((e)=>{
    console.log(e);
});
require('./UserDetails')
const User=mongoose.model("UserInfo");

app.get("/", (req,res)=>{
res.send({status:"Started"})
})
//kullanıcı oluşturma fonksiyonu(kullanılmıyor)
app.post('/register',async(req,res)=>{
    const {email,password}=req.body;
    const oldUser= await User.findOne({email:email});

    if(oldUser){
        return res.send({data:"User already exist!!"});
    }
    try{
        await User.create({
            email:email,
            password:password}
        )
        //res.send({status:"ok",data:"User Created"});
        res.status(200).json({
          success:true,
          message: "mesaj",
        });
    }catch(error){
        res.status(404).json({status:"error", data:"error"});
    }
});
app.post("/login-user", async (req, res) => {
    const { email, password } = req.body;
    console.log(req.body);
    const user = await User.findOne({ email: email });
  
    if (!user) {
      return res.send({ data: "User doesn't exists!!" });
    }
  
    if (await bcrypt.compare(password, user.password)) {
      const token = jwt.sign({ email: user.email }, JWT_SECRET);
      console.log(token);
      if (res.status(200)) {
        return res.status(200).json({
          success: 200,
          data: user,
        });
      } else {
        return res.send({ error: "hata" });
      }
    }
  });

  app.get("/user", async (req, res) => {
   res.status(200).json({
      status: "ok",
      data: "nice",
    });
  });

app.listen(5001,()=>{
    console.log("Node js server started");
});

