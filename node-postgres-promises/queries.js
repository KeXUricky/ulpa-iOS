var promise = require('bluebird');
var bodyParser = require('body-parser');
var options = {
  // Initialization Options
  promiseLib: promise
};

var pgp = require('pg-promise')(options);
var connectionString = 'postgres://ulpa:123456@localhost:5432/ulpa';
var db = pgp(connectionString);

// add query functions
function getAllinformation(req, res, next) {
  db.any('select public.subjects_subject.code as code, public.subjects_subject.state as state, public.subjects_subject.title as title, public.universities_university.name as school, public.subjects_subject.next_offered next_offered , public.subjects_subject.intensity, public.subjects_subject.url, public.subjects_subject.study_choice, public.languages_language.description as description from public.subjects_subject, public.universities_university, public.languages_language where public.subjects_subject.language_id = public.languages_language.id and public.subjects_subject.university_id = public.universities_university.id')
    .then(function (data) {
      res.status(200)
        .json({
          status: 'success',
          data: data,
          message: 'Retrieved ALL subjecties'
        });
    })
    .catch(function (err) {
      return next(err);
    });

    
}
function getdescription(req, res, next) {
  db.any('SELECT name, description FROM public.languages_language')
    .then(function (data) {
      res.status(200)
        .json({
          status: 'success',
          data: data,
          message: 'Retrieved ALL language with its name and description'
        });
    })
    .catch(function (err) {
      return next(err);
    });

}

function getAllLanguage(req, res, next) {
  db.any('SELECT name FROM public.languages_language')
    .then(function (data) {
      res.status(200)
        .json({
          status: 'success',
          data: data,
          message: 'Retrieved ALL languagename'
        });
    })
    .catch(function (err) {
      return next(err);
    });

}

function getLocation(req, res, next) {
  db.any('select public.subjects_subject.state as state, public.universities_university.name as school from public.subjects_subject, public.universities_university where public.subjects_subject.university_id = public.universities_university.id')
    .then(function (data) {
      res.status(200)
        .json({
          status: 'success',
          data: data,
          message: 'Retrieved ALL states and their universities'
        });
    })
    .catch(function (err) {
      return next(err);
    });

    
}

function getSingleLanguage(req, res, next) {
  var scLanguage = req.params.title;
  db.any('select public.subjects_subject.code as code, public.subjects_subject.state as state, public.subjects_subject.title as title, public.universities_university.name as school, public.subjects_subject.next_offered as next_offered , public.subjects_subject.intensity, public.subjects_subject.url, public.subjects_subject.study_choice from public.subjects_subject, public.universities_university, public.languages_language where public.subjects_subject.language_id = public.languages_language.id and public.subjects_subject.university_id = public.universities_university.id and public.languages_language.name = $1', scLanguage)
  .then(function (data) {
      res.status(200)
        .json({
          status: 'success',
          data: data,
          message: 'Retrieved ONE language'
        });
    })
    .catch(function (err) {
      return next(err);
    });
  

  
}
module.exports = {
  getAllinformation: getAllinformation,
  getSingleLanguage: getSingleLanguage,
  getLocation: getLocation,
  getAllLanguage: getAllLanguage,
  getdescription: getdescription
};

