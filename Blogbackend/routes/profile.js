const express = require("express")
const router = express.Router()
const Profile = require("../models/profileModel")
const middleware = require("../middleware")

router.route("/add").post(middleware.checkToken, (req, res) => {
    const profile = Profile({
        username: req.body.username,
        name: req.body.name,
        profession: req.body.profession,
        DOB: req.body.DOB,
        title: req.body.title,
        about: req.body.about
    });
    profile.save()
        .then(() => {
            return res.json({ msg: "profile successfully stored" })
        })
        .catch((err) => {
            return res.status(400).json({ err: err })
        })
})

module.exports = router