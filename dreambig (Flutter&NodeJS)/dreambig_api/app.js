const express = require('express');
const mysql= require('mysql');

const app= express();

const db =mysql.createConnection({
    host:"localhost",
    user:"root",
    password:"",
    database:"dreambig"
})

db.connect((err) => {
    if (err) {
      console.error('Veritabanına bağlanırken bir hata oluştu:', err.stack);
      return;
    }
    console.log('Veritabanına başarıyla bağlandı. Bağlantı ID:', db.threadId);
  });

  //Tüm üniversiteleri getiren api
  app.get("/university",(req,res)=>{
  const sql = "SELECT u_adi_tr,u_resmi,u_giris_resmi,u_ulkesi,u_city,kalite FROM university";
  db.query(sql,(err, data)=>{
    if(err) return res.json("Error");
    return res.json(data);
  }) 
  });

  //Seçilen ülkedeki üniversiteleri getiren api
  app.get("/country/:selectedCountry", (req, res) => {
    const selectedCountry = req.params.selectedCountry;
    const sql = "SELECT u_adi_tr,u_resmi,u_giris_resmi,u_ulkesi,u_city,kalite FROM university WHERE u_ulkesi=?";
    
    db.query(sql, [selectedCountry], (err, data) => {
        if (err) return res.json("Error");
        return res.json(data);
    });
});

//Seçilen ülkedeki okulların adını getiren api
app.get("/country/:selectedCountry/schoolName", (req, res) => {
  const selectedCountry = req.params.selectedCountry;
  const sql = "SELECT u_adi_tr FROM university WHERE u_ulkesi=?";
  
  db.query(sql, [selectedCountry], (err, data) => {
      if (err) return res.json("Error");
      return res.json(data);
  });
  
});

//Seçili okulu getiren api
app.get("/university/:selectedSchool", (req, res) => {
  const selectedSchool = req.params.selectedSchool;
  const sql = "SELECT  u_adi_tr,u_resmi,u_giris_resmi,u_ulkesi,u_city,kalite FROM university WHERE u_adi_tr =?";
  db.query(sql, [selectedSchool], (err, data) => {
      if (err) return res.json("Error");
      return res.json(data);
  });
});

/* app.get("/university/schoolName",(req,res)=>{
  const sql = "SELECT u_adi_tr FROM university";
  db.query(sql,(err, data)=>{
    if(err) return res.json("Error");
    return res.json(data);
  }) 
  }); */

  app.get("/university/allSchoolName", (req, res) => {
    const sql = "SELECT  u_adi_tr FROM university ORDER BY u_adi_tr";
    db.query(sql, (err, data) => {
        if (err) return res.json("Error");
        return res.json(data);
    });
  });


/* app.get("/university/country",(req,res)=>{
    const sql = "SELECT DISTINCT u_ulkesi FROM university";
    db.query(sql,(err, data)=>{
      if(err) return res.json("Error");
      return res.json(data);
    })
}); */

app.get("/country", (req, res) => {
  const sql = "SELECT DISTINCT u_ulkesi FROM university";
  
  db.query(sql, (err, data) => {
      if (err) return res.json("Error");
      return res.json(data);
  });
});


app.listen(8081,()=>{
    console.log("listening");
});