package mock

import (
	"github.com/frankegoesdown/bfym/pkg/utl/model"
)

// JWT mock
type JWT struct {
	GenerateTokenFn func(*gorsk.User) (string, string, error)
}

// GenerateToken mock
func (j *JWT) GenerateToken(u *gorsk.User) (string, string, error) {
	return j.GenerateTokenFn(u)
}
